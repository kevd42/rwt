function test_suite = test_mdwt
initTestSuite;

function test_mdwt_1D
       x = makesig('LinChirp',8);
       h = daubcqf(4,'min');
       L = 2;  % For 8 values in x we would normally be L=2 
       [y,L] = mdwt(x,h,L);
       y_corr = [1.1097 0.8767 0.8204 -0.5201 -0.0339 0.1001 0.2201 -0.1401];
       L_corr = 2;
assertVectorsAlmostEqual(y, y_corr,'relative',0.001);
assertEqual(L,L_corr);

function test_mdwt_compute_L1
       x = [1 2];
       h = daubcqf(4,'min');
       [~,L] = mdwt(x,h);
assertEqual(L,1);

function test_mdwt_compute_L2
       x = [1 2 3 4];
       h = daubcqf(4,'min');
       [~,L] = mdwt(x,h);
assertEqual(L,2);

function test_mdwt_compute_L3
       x = [1 2 3 4 5 6 7 8];
       h = daubcqf(4,'min');
       [~,L] = mdwt(x,h);
assertEqual(L,3);

function test_mdwt_compute_bad_L
       L = -1;
       x = [1 2 3 4 5 6 7 8 9];
       h = daubcqf(4,'min');
       
       mdwtHandle = @() mdwt(x,h);
assertExceptionThrown(mdwtHandle,'') ;
