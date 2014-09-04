% 【基本事実】
% アトム = 先頭が小文字（rubyのシンボルの様な固定値）
% 変数   = 先頭が大文字
% 変数の値は変更できるが, アトムは変更できない.

likes(wallace, cheese).
likes(grommit, cheese).
likes(wendolene, sheep).

friend(X, Y) :- \+(X = Y), likes(X,Z), likes(Y, Z).

% 【基本的な推論と変数】
% likes  = 事実(現実世界をそのまま写し取ったもの)
% friend = ルール(現実世界に関する論理的な推論)
%
% Prologは常にtrue/falseを返す.(結果を保留している時を除く)
%
% friendルールの:-の右側をサブコールという.
% この例では3つのサブコールが存在することになる.
% \+(X=Y)の\xが否定演算子なので,
% a-1. XとYが等しくないこと.
% a-2. XがZを好きであること.
% a-3. YがZを好きであること.
% これら全てを満たす時に初めてtrueが返る.
%
% friend(wendolene, grommit).
% 上記の場合, Prologは次のように二つのパターンを検証する.
% b-1. wendolene, grommit, cheese
% b-2. wendolene, grommit, sheep
% どちらもa-2, a-3のZの条件を満たすことがないのでfalseが返る.
%
% ※ ここのセマンティクスが分かりづらい...cheeseとsheepの二種類の
%   アトムがlikesに定義されてある事を知っていて、パターン検証してくれる？
