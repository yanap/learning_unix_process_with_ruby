static int
rb_daemon(int nochdir, int noclose)
{
    int err = 0;
#ifdef HAVE_DAEMON
    before_fork();
    err = daemon(nochdir, noclose);
    after_fork();
#else
    int n;

    switch (rb_fork(0, 0, 0, Qnil)) {
      case -1:
  rb_sys_fail("daemon");
      case 0:
  break;
      default:
  _exit(EXIT_SUCCESS);
    }

    proc_setsid();

    /* must not be process-leader */
    switch (rb_fork(0, 0, 0, Qnil)) {
      case -1:
  return -1;
      case 0:
  break;
      default:
  _exit(EXIT_SUCCESS);
    }

    if (!nochdir)
  err = chdir("/");

    if (!noclose && (n = rb_cloexec_open("/dev/null", O_RDWR, 0)) != -1) {
        rb_update_max_fd(n);
  (void)dup2(n, 0);
  (void)dup2(n, 1);
  (void)dup2(n, 2);
  if (n > 2)
      (void)close (n);
    }
#endif
 return err;
}
#else
#define proc_daemon rb_f_notimplement
#endif
