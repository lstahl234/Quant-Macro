%% %% **Matrices and Operators**
%% *Definition of matrices*
% Blank or comma separates columns, semicolon separates rows
A = [1 2; 3 4];
B = [2 3; 4 5];

%% *Matrix Operations*
% Matrix multiplying matrices
A*B;
% Multiplying each element in *A* with corresponding element in B
A.*B

%% *Matrix left and right division*
%Matrix right divide:
A/B;
%Roughly the same as (different algorithms):
A*inv(B)

%Element-wise operation./ divides every element of A with corresponding
%elements of B
A./B

%Matrix left division
A\B;
%Roughly the same as:
inv(A)*B
%If X mxn matrix and y column vector with m components, then b = X\y least
%square solution to y=X*b
%b=X\y is computed using the QR-decomposition and is hence numerically more
%efficient than
%the formula b=(X'*X)^(-1)*X'y

%% *Single out elements of matrices*
%"Matrix(row, column)
A(1,2)
%**Working with matrices is much faster than with scalars**
%With matrices higher dimensional arrays acan be used 
C(:,:,1)=A;
C(:,:,2)=B;
%Colon represents 'all rows' or 'all columns'

%% The Colon operator
%Vectorize a matrix using the colon operator: Matrix(:) [Arranging all
%array elements consecutively in one column vector]
D=A(:)
%Matlab follows column-major order: Elements of an array are counted along
%the respective column, s.t. the first overall element of A is A(1,1), the
%second overall element is A(2,1) and the third overall element is A(1,2)

%% The keyword 'end'
%Two purposes:
%1. Adress last element of matrix or vector
A(1,end)
%2. Performing integer arithmetic with 'end', s.t. end serves as a
%placeholder for number of elements along this matrix dimension
A(end, end-1)

%% Transpose a matrix or a vector
%Use ' to transpose a matrix
D';

%% Sum elements of a matrix
% Use 'sum' to sum along the elements of a vector
sum(D)
%Or of a matrix, either along the columns
sum(A,1)
%or the rows:
sum(A,2)

%% Determine the size of a matrix
%'size' 
size(A)
%Can be used along dimensions
%Either along rows:
size(A,1)
%Or alomng columns:
size(A,2)
%For one-dimensional arrays:
length(A)

%% Define special matrices
% 'zeros': Matrix with only zero entries
G=zeros(4,2);
% 'eye': Defines identity matrix
H=eye(4);
% 'ones': Matrix with only one entries

%% Single out the diagonal of a matrix
%'diag'
diag(A)

%% Concatenation
%Combine matrices of conformable dimensions to a new matrix:
K=[A B]

%% Modulo
%'mod' gives remainder of a division:
mod(7,4)

%% Absolute value 
%Absolute value of an array: abs(x)


%% %% **Cleaning Up**
clear all        %Clears all variables from memory; 
                 %often at beginning of new programs; avoid to put within scripts in larger projects
clear            %Deletes variables in current workspace/function
close all        %Closes all open figures
clc              %Clears command window


%% %% **Variable types**
% Different data types have different symbols in the workspace

%% Doubles 
%'Double-Precision Floating Point'
%Typical numeric data type used in matlab
A=[1 2; 3 4];
%% String arrays
%Stores characters instead of numbers
%Use quotes in assignment
B='Why so serious?';

%% Cell arrays and structures
%Function like cabinet with different drawers, which can hold different
%data types respectively
%Can be used to organize workspace
%% Cell arrays
%Use curly brackets
E={'Why so serious?';2}; %2 by 1 cell array with C{1,1} as string and C{2,1} as double
%Two ways of addressing contents of cell array:
%1. Curly brackets return content of respective cell:
E{1,1};
E{2,1};
%2. Round brackets returns subset of cell array:
E(1,1);
%% Structures
%Multidimensional Matlab arrays, with elements accessed by textual field
%designators
D.any_field_name_1='Why so serious?';
D.any_field_name_2=2;
%Dot: Used to separate respective field names from name of underlying
%structure
%Most likely encountered when using one of Econometric toolboxes

%% Boolean
%Logical data types, that can store only 'true(1)' or 'false(0)'
%Appear when testing for logical conditions
a=1;
b=2;
a==b;     %Tests whether a is equal to b
%Logical statements can be combined using logical operators 'and(%)' and
%'or(|)'
%Scalar statements: Short-circuit operators && and || are used; negation is
%implemented via '~'
a>b && b~=1
b==1 || a<0
%Commonly used logical operators
any(A,2) %Checks whether array A contains at least one non-zero element among dimension
all(A,2) %Checks whether all elements are different from 0
%Second input gives dimension along which to check condition
%By default 'any' and 'all' move along first dimension (rows): 'any(A)'
%results in row vector indicating whether any row of respective column
%contained a non-zero element
any(any(A)) %Stack calls to check whole matrices


%% %% **Control statements**
%Two general types of control statements, that allow you two determine
%which pieces of your code should be executed:
%% Branching statements
%Two branching statements very similar to regular english
%'if','elseif','else': Makes code execution dependent on whether certain logical conditions
%are satisfied
%Every statement that evaluates to Boolean can be used
%Example

mynumber = input('Enter an integer:');

if mod(mynumber,2)==0
    disp('Even');
elseif mod(mynumber,2)==1
    disp('Odd');
else                                %Catch-all for all cases not considered explicitely in 'if' and 'ifelse'-conditions
    error('Number is no integer');
end

%Less frequently used:
%'switch-case-end':
switch mynumber
    case -1
        disp('negative one');
    case 0 
        disp('zero');
    case 1
        disp('positive one');
    otherwise
        disp('other value');
end

%% Control loops
%Allow repeatedly executing the same lines of code without explicitely
%repeating them every time
%'for-end'-loops: Execute for predefined number of times

total_sum = 0;

for ii=1:1000
    total_sum=total_sum+ii;
end

%At beginning of statement ii is set to 1 and incremented by 1 in every
%iteration until ii equal to 1000

%'while'-loops: Repeats code until termination criterion is reached

n = 1;
nFactorial = 1;

while nFactorial < 1e10
    n = n + 1;
    nFactorial = nFactorial * n;
end

% Inner part of loop is repeated as long as 'nFactorial < 1e10' evaluates
% to 'true(1)

%% Logical indexing
% Allows to avoid using loops
%Example: Suppose you wanna delete all elements of a random vector 
%'a=randn(1000,1)' that are smaller than 0
% Logical indexing is way faster than iterating over all 1000 elements via
% a loop
%Use boolean vector created by a<0 to address the rows of vector 'a' that
%should be deleted:
a=randn(1000,1);
%a(a<0,:) = [] %All rows where a<0 evaluates to true are set to empty matrix


%% %% **Functions**
%% Calling matlab functions
% Call functions by providing them with input arguments
% Typically: Minimum number of arguments + optional arguments
%Example:
X = [1 2 3; 4 5 6; 7 8 9; 10 11 12];
d= max(X);       %'max' returns 1 by 3 vector with single largest element of each column

d2 = max(X,[],2);   %Take maximum along k=2 dimension; max(X,Y) would deliver largest elements contained in X or Y along default dimension, hence we need [] as second argument

%Additional output arguments: Call function with additional output
%arguments
[d , ~] = max(X,[],2); %Provides largest elements along k=2 in d 
% and in 'indices', the corresponding index number of the largest elements
% With more than one output argument: Output always enclosed in square
% brackets
% Output of not required arguments may be suppressed with a '~' and
% separating arguments with a comma:
[~, indices] = max(X,[],2);

%% Writing your own functions
%First line of fct. file must have following structure:
%'function [output] = name_of_the_function(input)'
%Example: Write a fct. that takes as input a vector of numbers and that
%calculates the variance of these numbers and delivers it as an output

%see compute_variance.m

% Name of fct. should correspond to name of m-file
fCompVar = [1 2 5 7 3 9 22 12 33 17 12]';

Variance = compute_variance(fCompVar);
%% %% **Local vs. Global Variables**
%% Local variables
% By default Matlab fcts. use local variables, s.t. the variables defined
% inside a fct. are only known to that fct. and cannot be used by others
% unless you explicitely hand them over as fct input
%See 'compute_variance'-function: 'var_mean' as well as 'outvalue' are
%local to the function abd cannot be accessed from the mainscript
%'outvalue' as output argument from fct. is stored in 'Variance' hence it
%is assigned to that variable in the main script

%% Global variables
% Putting 'global var_name' iat beginning of main script, makes sure that
% 'var_name' can be used/is known by other functions s.t. it can be used by
% subfunctions via calling 'global var_name'
% Changes to the variable that occur due to the use in subfunctions are
% also visible to other function

%%%% NOT RECOMMENDED TO USE GLOBAL VARIABLES UNLESS YOU REALLY KNOW WHAT
%%%% YOU ARE DOING

%% %% **Statistical functions**
% Some statistica functions require statistics toolbox

%% Descriptive Statistics
% mean(A, dim);
% median(A, dim);
% std(A,flag, dim);
% A: array of doubles; dim: Dimension along which statistic is computed
% flag: Boulean (0 or if N-1 or N should be used in divisor to generate
% unbiased estimate of std)

%[d, indices] = min(X,[],k)
%[d, indices] = max(X,[],k): Minimum and maximum of respective elements along dimension k

%quantile(X,p): p-th quantile of X

%% Statistical distribution
%rand(m,n): Generates m by n array of pseudo-random numbers from UNIFORM
%distribution
%randn(m,n): Generates m by n array of pseudo-random numbers from NORMAL
%distribution

% Evaluating density and cumulative density functions
% 'normpdf(x,mu,sigma)': Density function of x with mean 'mu' and std 'sigma'
% 'normcdf(x, mu, sigma)': Cummulative Density function of x with mean 'mu'
% and std 'sigma'
%For beta and gamma distributions:
% 'betapdf'/'betacdf'
% 'gammapdf'/'gammacdf'

%% %% **Rounding**
% 'round(x)': Integer closest to x
% 'floor(x)': Closest integer smaller than x
% 'ceil(x)': Closest integer larger than x

%% %% **Plots**
%General way:
% 'plot(x-data,y-data, options)'
% 'options':    'b:' -> Blue dotted line
% labeling axis:
% xlabel('name of axis'), ylabel('name of axis')
% title('this is title')
% legend('name first series', 'name second series');

% Typically plots are saved as .fig-files where the actual data is stored
% and can be changed using the plot tools.
% To convert a plot to pdf:
%'print('-dpdf','name the pdf file')
% To convert to eps-file:
% print('-depsc2','name the eps file')
% and then use 'eps2pdf'

%% %% **Load/save data**

%'save anyname': Saves complete workspace
%'save anyname A B': Saves only variables A and B
% file is named 'anyname.mat'

% 'load anyname' or 'load anyname A'

% Recommended way:
% Use functional form of commands:
% 'save('anyname', 'A','B')

%% %% **Data**
% Use import wizard or copy dataset into matlab file (?)

% 'diff(data)': Computes first difference of time series data
% 'corr([data1,data2])': Computes correlation between data1 and data2

% 'time = start_data:frequency:end_date': Defines time when plotting time
% series data (0.25: quarterly data, 1: annual data)

%Import data from excel:
% [numerical_data text_data] = xlsread('C:\Some
% folder\...\Datafile.xlsx','Name of excel sheet','A10:X10');


%% %%%%%% More advanced topics
%% %% *Dynamic Field Referencing
% Easy way to access and create subfields from arbitrary strings with field
% name given by string
for ii=1:2
    my_structure.(['field_',num2str(ii)])=ii;
end

% Creates structure named 'my_structure' with subfields that have the names
% 'field_1' and 'field_2' and store value of respective index variable 'ii'

%% %% *The eval command
% 'eval': Allows executing a given string as Matlab code
% Example: Doing the same as before with dynamic field creation
for ii=1:2
    eval(['structure.field_',num2str(ii),'=ii;']);
end

%% %% *Debugging
% See Pfeifer handout

%% %% *Numerical Optimization
% 'fsolve': Numerical solver for lon-linear systems of equations
% Example: Find root of y = x^2 + 3x - 10
[x_opt, fval, exitflag] = fsolve(@(x) x^2+3*x-10,0)
% 'x_opt': Returned solution
% 'fval': function value y at x_opt
% 'exitflag': Code for reason why algorithm terminated; 
% Succesful in solving: y = 0, exitflag = 0
% Input arguments:
% @(x): Function handle, "for which variable should the equation be solved"
% 0: Starting value for algorithm

% Also possible to provide own functions to Matlab's Optimization Routines
% E.g.: Function that computes y for given x in above equation:
%function outvalue = simple_parabola(x)
%outvalue=x^2+3*x-10;
%end

% Then you can provide a function handle to 'simple_parabola' to 'fsolve':
% [x_opt, fval, exitflag] = fsolve(@simple_parabola,0)

% Good starting point for numerical optimization on which algorithms/solver to use: Matlab help
% In general: Fcts differ whether porblem is
% i) nonlinear
% ii) differntiable
% iii) univartiate or multivariate
% iv) solving or minimizing a fct
% v) features constraints

%% Important solvers for economic applications
% i) 'fminbind': Mimimum of single-variable continuous fct on fixed
% interval (e.g. solve for optimal labor-supply)
% ii) 'csminwel.m' by Chris Sims: Minimizes scalar-valued continuous fct
% over vector of arguments

%% %% *Precedence rules
% Expressions in brackets > exponentials > multiplication/division >
% addition/subtraction
% From left to right

% Take care when mixing 'true' matrix algebra like matrix multiplication
% with element-wise operations (with element-wise operations rather use
% more than fewer brackets

%% %% *Object-Oriented Programming
% Most prominently used in Econometrics Toolbox (proprietary)
% Difference to function-oriented programming: 'objects' (data structures
% consisting of data fields and methods/functions to work on data or to
% interact with other objects) are used

%Example: Mersenne Twister-Algorithm to create random numbers with seed 1
s = RandStream('mt19937ar', 'Seed',1); % Creates 'RandStream object 's'
s.get; % Reads out properties
% Difference to before: Fcuntion is used after the dot not a data field
s.State; % See current state
rand(s);
s.State;
s.reset; % Resets random number generator to initial state

%% %% *Profiling your code
% How fast does your code run?
% Where are the bottlenecks?
% Use 'tic toc'-construct:
% Check whether using loop to delete negative values of vector or logical
% indexing is faster
a=randn(10000,1);
b=a;
tic
iter=1;
while iter<=length(a)
    if a(iter,1)<0
        a(iter,:)=[];
    else
        iter=iter+1;
    end
end
toc

tic
b(b<0,:)=[];
toc

%% %% *Advanced Plotting
% 3-D-graphs:  http://www.bu.edu/tech/research/training/tutorials/

%Example: C-D-production function along capital and labor dimensions
k=[0:0.01:1]';
l=[0:0.01:1]';
alppha = 0.3175; %Capital share

% Define two-diomensional grid of combinations of capital and labor for
% which fct. should be plotted
[K,L] = meshgrid(k,l);

% Use element-wise operations to compute production for grid combinations
% of labor and capital:
Y=K.^alppha.*L.^(1-alppha);

% Create a figure with figure handle 'h' (figure handle = name)
h = figure
% Use 'surf'-plot with y,x and z given by capital, labor and output:
surf(K,L,Y)
% Label axes in font size 14
xlabel('Capital','FontSize',14)
ylabel('Labor','FontSize',14)
zlabel('Output','FontSize',14)
%Title graph:
h=title('Cobb-Douglas-Production Function')
%Increase font size of title
set(h,'FontSize',14);
%Increase font size of axes
set(gca,'FontSize',14); %'gca': Get current axes

% Matlab used renders to create figures: 
% 'painters': Fast and usually used for easy and small objects
% 'zbuffer': Complex scenes
% Usually matlab specifies the renderer it needs
% Manual specification in 'print'-command:
print -depsc2 -painters CobbDouglasGraphzbuffer




