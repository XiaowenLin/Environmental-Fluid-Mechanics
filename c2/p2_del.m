function [InP1, N] = p2(f, delta, varargin)
% Arguments:
% f: function
% delta: tollerance
% Output:
% I: integral
% N: number of segments to break the range
% varargin        Parameters with default values
%                 x1: 0
%                 x2: 4
%                 NMax: 10000
p.x1 = 0;
p.x2 = 4;
p.NMax = 1000;
p.N = 1;

validParams     = {     ...
  'x1',          ...
  'x2',            ...
  'NMax',       ...
  'N',       ...
  };

if nargin > 2
  if mod( numel( varargin ), 2 ) ~= 0
      % if the number of varargin is not 2n, report error
    error( 'p2:InvalidInput', ['All input parameters after the fileName must be in the ' ...
      'form of param-value pairs'] );
  end
  % a dictionary: key and value
  params  = lower( varargin(1:2:end) ); %  2n+1 part of the varargin are strings. to the lower case
  values  = varargin(2:2:end); %  2n+2 part of the varargin are values

  if ~all( cellfun( @ischar, params ) )
      % Determine if all array elements are nonzero or true
      % apply iscahr to all in params
    error( 'p2:InvalidInput', ['All input parameters after the fileName must be in the ' ...
      'form of param-value pairs'] );
  end

  lcValidParams   = lower( validParams ); % lower case valide parameters
  for ii =  1 : numel( params )
    result        = strmatch( params{ii}, lcValidParams );
    % If unknown param is entered ignore it
    if isempty( result )
      continue
    end
    % If we have multiple matches make sure we don't have a single unambiguous match before throwing
    % an error
    if numel( result ) > 1
      exresult    = strmatch( params{ii}, validParams, 'exact' );
      if ~isempty( exresult )
        result    = exresult;
      else
        % We have multiple possible matches, prompt user to provide an unambiguous match
        error( 'p2:InvalidInput', 'Cannot find unambiguous match for parameter ''%s''', ...
          varargin{ii*2-1} );
      end
    end
    result      = validParams{result};
    p.(result)  = values{ii};
  end
end


%%
InP1 = 0;
In = 100;
while abs((InP1 - In)*2/(InP1 + In)) < delta
    N = N + 1;
    x = 1:1:(N+1);
    step = (p.x2-p.x1)/N;
    In = InP1;
    InP1 = 0;
    for i = 1:N
        x(i+1) = x(1) + (i-1)*step;
        fi = eval(subs(f,'x',x(i)));
        fiP1 = eval(subs(f,'x',x(i+1)));
        InP1 = InP1 + fi + fiP1;
    end
end

%%








end


