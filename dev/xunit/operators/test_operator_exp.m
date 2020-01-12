function tests = test_operator_exp
tests = functiontests(localfunctions);

function test1(dummy)

sdpvar x y
obj = -x;
sol = solvesdp((exp(2*x + 1) <= 3),obj,sdpsettings('solver','fmincon'));

assert(sol.problem == 0)
assert(abs(double(obj)--0.04930614506222) <= 1e-4);

sdpvar x y
obj = -x-y;
sol = solvesdp((exp(max([2*x+1 3*y+2])) <= 3),obj,sdpsettings('solver','fmincon'));

assert(sol.problem == 0)
assert(abs(double(obj)-0.25115642610991) <= 1e-4);


sdpvar x y
obj = -x-y;
sol = solvesdp((exp(min([2*x+1 3*y+2])) <= 3),obj,sdpsettings('solver','fmincon','warning',0));
assert(sol.problem == -4)

sdpvar x y
obj = -x-y;
sol = solvesdp((max([exp(2*x+1) exp(3*y+2)]) <= 3),obj,sdpsettings('solver','fmincon'));

assert(sol.problem == 0)
assert(abs(double(obj)-0.25115642610991) <= 1e-4);
