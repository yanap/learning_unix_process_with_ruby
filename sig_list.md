シグナル      番号 アクション 説明
-------------------------------------------------------------------------
￼
SIGHUP          1       Term
SIGINT          2       Term
SIGQUIT         3       Core
SIGILL          4       Core
SIGABRT         6       Core
SIGFPE          8       Core
SIGKILL         9       Term
SIGSEGV        11       Core
SIGPIPE        13       Term
SIGALRM        14       Term
SIGTERM        15       Term
SIGUSR1     30,10,16    Term
SIGUSR2     31,12,17    Term
SIGCHLD     20,17,18    Ign
SIGCONT     19,18,25    Cont
SIGSTOP     17,19,23    Stop
SIGTSTP     18,20,24    Stop
SIGTTIN     21,21,26    Stop
SIGTTOU     22,22,27    Stop
制御端末のハングアップ検出、
     または制御しているプロセスの死
キーボードからの割り込み キーボードによる中止 不正な命令
abort(3) からの中断シグナル 浮動小数点例外
Kill シグナル
不正なメモリ参照
パイプ破壊: 読み手の無いパイプへの書き出し alarm(2) からのタイマーシグナル 終了シグナル
ユーザ定義シグナル 1
ユーザ定義シグナル 2 子プロセスの一時停止または終了 一時停止からの再開
プロセスの一時停止 端末より入力された一時停止 バックグランドプロセスの端末入力 バックグランドプロセスの端末出力
シグナル SIGKILL と SIGSTOP は補足も保留も無視もできない。
