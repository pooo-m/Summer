clear all
lambda4 = 0:1:30;
N = 0:100:7000;
figure(1);
M4 = [0 41.579 82.532 120.01 156.649 186.203 221.832 258.778 283.54 315.586 342.608 376.37 395.21 421.464 441.578 468.944 488.061 512.596 530.019 546.623 566.174 588.204 597.671 618.829 636.903 652.033 663.389 678.385 687.792 699.088 714.248 ];
M4theor = [0.0 40.963301817396044 80.24861153900909 117.9246652615057 154.05738342407938 188.70998614707656 221.94310384597327 253.81488331423708 284.38108946068485 313.69520287934296 341.8085134225233 368.770209940837 394.62746634716206 419.425524155145 443.20777163665423 466.0158197366826 487.8895748785237 508.8673087866098 528.9857254491737 548.2800253379012 566.7839669969312 584.5299261089709 601.548952141865 617.8708226747355 633.5240954987436 648.5361585836317 662.9332779974719 676.7406438634617 689.98241443418 702.681758360413 714.860895228513 ];
T = [0 16.423 27.34 37.234 42.42 45.346 47.877 49.135 49.432 48.215 47.788 46.922 44.899 43.573 41.91 39.918 37.872 36.098 34.853 32.468 31.205 29.344 28.665 26.687 25.285 23.644 23.407 21.433 21.563 20.376 18.409 18.405 16.984 16.614 15.968 15.834 15.068 13.452 13.136 12.626 11.852 12.549 11.315 10.387 9.758 10.268 9.701 9.309 9.237 8.566 8.282 7.836 7.802 7.583 7.646 7.215 6.673 6.34 5.922 6.054 5.849 4.904 5.625 5.252 4.159 4.711 4.966 4.641 4.043 4.737 3.826 ];
Ttheor = [0 16.490279218500653 28.548839420304276 37.155679853344445 43.08384783641596 46.94287900308443 49.213041039802675 50.27235619393465 50.41794637472786 49.88290912782219 48.84967143408887 47.46056446226277 45.8262032128275 44.032130483295205 42.14408707231982 40.212193666721184 38.27426980296258 36.35846807598537 34.485364593839954 32.66961737352421 30.921281247284863 29.24684957590739 27.650078611215747 26.132638903602917 24.694629076364134 23.334980087885558 22.051772383039875 20.842483787642195 19.70418238113109 18.63367570069975 17.62762533317434 16.68263411899752 15.795311730685633 14.962323220740977 14.180424201422186 13.446485573499078 12.757510125366354 12.110642847586963 11.503176427119481 10.932553081040984 10.396363646254395 9.89234464727858 9.418373909017683 8.972465157597973 8.552761953704158 8.157531224343295 7.785156596605348 7.434131687561749 7.103053465368474 6.790615765849702 6.495603024670938 6.216884266333729 5.95340737656748 5.704193673397925 5.468332783547522 5.244977824316885 5.03334088626504 4.832688808494358 4.642339235868983 4.4616569458262125 4.290050431396812 4.126968726488066 3.9718984592875484 3.8243611197247502 3.6839105272097687 3.550130485296563 3.4226326104481104 3.3010543226777327 3.1850569864778855 3.074324191104365 2.9685601599445643 ];
plot(lambda4,M4,'--','Linewidth',3);
hold on;
plot(lambda4,M4theor,'Linewidth',2);
legend("Моделирование","теория");
xlabel('Интенсивность');
ylabel('М');
figure(2);
plot(N,T,'Linewidth',2);
hold on;
plot(N,Ttheor,'--','Linewidth',2);
xlabel('N');
ylabel('T');


%part 2
figure(3);
n = 0:10:2000;
PrFix = [0.0, 0.0690138027605521, 0.9998028002366397, 0.9994007191370355, 0.9967935871743487, 0.9796128500823723, 0.9149536477226925, 0.77984998986418, 0.5890192958026657, 0.3955652346070085, 0.24616316639741517, 0.15218718209562562, 0.08548195160650536, 0.045758051846032995, 0.030272039271834732, 0.020336894001643385, 0.012095120951209511, 0.005324393610727667, 0.004031445273130417, 0.003115264797507788, 9.823182711198428E-4, 0.0010066438494060802, 4.0290088638195E-4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
PrRand = [0.0, 0.14782956591318264, 0.9992112009465589, 0.9998002397123452, 0.9927855711422846, 0.9699341021416804, 0.9113260781942765, 0.7745793634705047, 0.5894171474040183, 0.39615917640071274, 0.2718093699515347, 0.15544252288911495, 0.09381197937326458, 0.04752553024351924, 0.03231744733074248, 0.021158586688578472, 0.011275112751127511, 0.004929994084007099, 0.003023583954847813, 0.002284527518172378, 0.0015717092337917485, 0.0, 2.01450443190975E-4, 1.996007984031936E-4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
T2 = [0.0, 3.637, 6.484, 8.72, 10.557, 12.085, 13.044, 13.832, 14.127, 14.441, 14.436, 14.433, 14.014, 13.79, 13.611, 12.801, 12.592, 12.114, 11.505, 11.029, 10.599, 10.001, 9.485, 8.858, 8.411, 7.937, 7.468, 6.927, 6.66, 6.248, 5.756, 5.509, 5.12, 4.577, 4.517, 3.978, 3.828, 3.519, 3.297, 3.1, 2.851, 2.622, 2.494, 2.327, 2.12, 1.964, 1.804, 1.653, 1.54, 1.467, 1.362, 1.276, 1.123, 1.085, 0.958, 0.876, 0.866, 0.811, 0.74, 0.647, 0.602, 0.565, 0.519, 0.497, 0.463, 0.426, 0.398, 0.377, 0.338, 0.315, 0.316, 0.248, 0.279, 0.205, 0.24, 0.179, 0.198, 0.165, 0.139, 0.11, 0.14, 0.103, 0.122, 0.103, 0.12, 0.078, 0.086, 0.076, 0.061, 0.064, 0.066, 0.044, 0.054, 0.042, 0.046, 0.034, 0.033, 0.03, 0.045, 0.028, 0.028, 0.025, 0.022, 0.025, 0.02, 0.017, 0.011, 0.014, 0.011, 0.014, 0.011, 0.013, 0.011, 0.008, 0.007, 0.007, 0.009, 0.002, 0.006, 0.003, 0.007, 0.009, 0.004, 0.002, 0.003, 0.0, 0.005, 0.002, 0.003, 0.002, 0.003, 0.003, 0.003, 0.001, 0.003, 0.003, 0.001, 0.002, 0.001, 0.0, 0.0, 0.001, 0.001, 0.001, 0.0, 0.0, 0.0, 0.001, 0.0, 0.0, 0.002, 0.0, 0.0, 0.0, 0.002, 0.001, 0.002, 0.001, 0.0, 0.0, 0.0, 0.0, 0.001, 0.0, 0.0, 0.0, 0.001, 0.001, 0.001, 0.0, 0.0, 0.001, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.001, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
theorT2 = [0.0, 3.591504517561432, 6.490349763851472, 8.796725686508827, 10.59794044583567, 11.969973157072078, 12.978846955101849, 13.681842595665566, 14.128570579444533, 14.361917799338283, 14.4188829409947, 14.331313289018418, 14.12655418559055, 13.828021135990474, 13.455703440195181, 13.026607236579792, 12.555144959565505, 12.053477426075773, 11.531814065346211, 10.998676183590472, 10.461127600863255, 9.92497650469093, 9.394951926973766, 8.874857861332986, 8.367707692155314, 7.875841299325424, 7.401026929793839, 6.944549684923198, 6.507288257617883, 6.089781362564028, 5.692285133809064, 5.314822614003066, 4.957226326779697, 4.619174806075651, 4.3002238519846205, 3.9998331905103677, 3.7173891329834667, 3.452223758744999, 3.203631080916428, 2.9708805987233275, 2.753228590081317, 2.5499274542380816, 2.3602333755312026, 2.1834125451769273, 2.0187461479250315, 1.8655342939331818, 1.7230990529164043, 1.5907867271456326, 1.4679694818773423, 1.354046436004284, 1.2484443018683045, 1.1506176510423323, 1.0600488722678185, 0.9762478784472168, 0.8987516114800036, 0.8271233866548425, 0.7609521121456002, 0.6998514137951029, 0.6434586907106272, 0.5914341231532634, 0.5434596507035937, 0.499237935661641, 0.45849132403063697, 0.42096081418972264, 0.3864050414342833, 0.3545992849137773, 0.3253345020900126, 0.29841639464254266, 0.27366450873464576, 0.2509113716990388, 0.23000166648583834, 0.2107914446177008, 0.19314737790226644, 0.17694604874571906, 0.16207327858100276, 0.14842349365910937, 0.13589912724238312, 0.12441005707670637, 0.11387307689754365, 0.10421140063688651, 0.0953541979387428, 0.0872361595552653, 0.07979709117986969, 0.07298153427426114, 0.06673841246017222, 0.06102070207123992, 0.05578512549361523, 0.050991865963728344, 0.046604302536534234, 0.04258876398618547, 0.03891430045229077, 0.03555247169776299, 0.03247715089795119, 0.02966434293463214, 0.02709201622197068, 0.02473994714431339, 0.022589576237306463, 0.02062387529405516, 0.018827224626657812, 0.017185299760296018, 0.015684966882033077, 0.014314186409491418, 0.013061924085605053, 0.011918069044659325, 0.01087335833184348, 0.009919307393575232, 0.009048146088948331, 0.008252759803852604, 0.0075266352786788355, 0.006863810788111704, 0.006258830337401894, 0.00570670156376492, 0.0052028570542535044, 0.0047431188126668316, 0.0043236656278689695, 0.003941003114364073, 0.003591936213190824, 0.0032735439572242186, 0.0029831563198784235, 0.0027183329800571842, 0.002476843849062419, 0.0022566512171092014, 0.0020558933881652717, 0.0018728696820919173, 0.001706026692564045, 0.00155394569804121, 0.0014153311311963907, 0.0012890000197305735, 0.0011738723184516022, 0.0010689620589152888, 9.733692488533177E-4, 8.862724590813425E-4, 8.069220406250416E-4, 7.346339194527902E-4, 6.687839204899842E-4, 6.088025765389909E-4, 5.541703813653974E-4, 5.044134495592026E-4, 4.590995488606989E-4, 4.1783447347537177E-4, 3.8025872950908293E-4, 3.4604450605165663E-4, 3.148929076400278E-4, 2.8653142585642496E-4, 2.607116296766371E-4, 2.372070558911994E-4, 2.158112824903074E-4, 1.9633616934252E-4, 1.7861025181808225E-4, 1.6247727421945618E-4, 1.477948509931361E-4, 1.3443324471611114E-4, 1.2227425078487297E-4, 1.1121017959151249E-4, 1.0114292775654332E-4, 9.198313070746051E-5, 8.364938955106938E-5, 7.60675657912467E-5, 6.917013799658497E-5, 6.28956150285074E-5, 5.7188000903787396E-5, 5.1996306789505836E-5, 4.727410601659315E-5, 4.2979128353228175E-5, 3.907289010425535E-5, 3.552035689996376E-5, 3.2289636309370526E-5, 2.9351697661697016E-5, 2.6680116686977482E-5, 2.425084279449204E-5, 2.2041986997615952E-5, 2.0033628667236666E-5, 1.8207639454494557E-5, 1.6547522868522973E-5, 1.5038268127262569E-5, 1.3666217020371078E-5, 1.2418942633720236E-5, 1.1285138885862585E-5, 1.0254519918981893E-5, 9.317728470964194E-6, 8.466252432028673E-6, 7.692348859469285E-6, 6.988974788054716E-6, 6.349724232043828E-6, 5.768770828078292E-6, 5.240815616855225E-6, 4.761039505864012E-6, 4.325059995962357E-6, 3.9288917915045565E-6, 3.5689109474287976E-6, 3.2418222374420293E-6, 2.9446294554687586E-6, 2.6746083880895E-6, 2.429282219001165E-6, 2.2063991477821156E-6, 2.003912024618822E-6, 1.819959820313211E-6, 1.652850766990033E-6, 1.5010470195987635E-6, 1.3631507016799126E-6, 1.2378912110553464E-6];
T3 = [0.0, 3.576, 6.474, 8.803, 10.679, 11.922, 12.895, 13.504, 13.88, 14.235, 14.482, 14.2, 13.941, 13.76, 13.319, 13.151, 12.474, 12.086, 11.417, 11.078, 10.403, 10.007, 9.615, 8.981, 8.516, 7.843, 7.505, 7.018, 6.716, 6.139, 5.771, 5.428, 5.102, 4.641, 4.433, 4.024, 3.835, 3.606, 3.468, 3.29, 2.865, 2.672, 2.448, 2.337, 2.146, 2.041, 1.847, 1.752, 1.672, 1.515, 1.381, 1.283, 1.149, 1.074, 1.023, 0.879, 0.859, 0.842, 0.727, 0.694, 0.667, 0.601, 0.529, 0.511, 0.508, 0.458, 0.397, 0.354, 0.344, 0.336, 0.319, 0.238, 0.259, 0.237, 0.265, 0.207, 0.178, 0.205, 0.171, 0.146, 0.144, 0.115, 0.101, 0.098, 0.093, 0.096, 0.097, 0.091, 0.076, 0.073, 0.058, 0.057, 0.055, 0.048, 0.048, 0.06, 0.041, 0.031, 0.033, 0.026, 0.029, 0.026, 0.022, 0.017, 0.024, 0.018, 0.017, 0.015, 0.015, 0.017, 0.015, 0.017, 0.009, 0.015, 0.006, 0.011, 0.004, 0.008, 0.012, 0.013, 0.006, 0.008, 0.002, 0.007, 0.001, 0.002, 0.005, 0.0, 0.002, 0.002, 0.002, 0.005, 0.002, 0.0, 0.002, 0.0, 0.001, 0.0, 0.001, 0.001, 0.001, 0.0, 0.0, 0.001, 0.0, 0.003, 0.002, 0.0, 0.001, 0.0, 0.001, 0.001, 0.001, 0.0, 0.0, 0.003, 0.0, 0.0, 0.001, 0.0, 0.0, 0.001, 0.0, 0.0, 0.0, 0.0, 0.001, 0.0, 0.001, 0.0, 0.0, 0.0, 0.001, 0.0, 0.001, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

plot(n,T2,'Linewidth',2);
hold on
plot(n,theorT2,'--','Linewidth',2);
hold on
plot(n,T3,'--','Linewidth',2);
legend("fix","theor","rand");
xlabel('N');
ylabel('T');

figure(4);
prFix = [0.0, 0.0914483144272248, 0.16504815569675899, 0.22255145669682808, 0.26977211123381184, 0.30469512559510764, 0.33230843431603063, 0.34577457745774576, 0.3630617837070224, 0.36454503904775154, 0.36518285221368535, 0.34765499518149695, 0.34137030339561986, 0.3313846465055123, 0.3121101871101871, 0.30190442111959287, 0.29918188546396496, 0.2843001979722839, 0.2697874039325282, 0.26156418728342334, 0.24451161310849506, 0.23579350675539423, 0.2170842642834344, 0.21001949783136364, 0.19865366944988214, 0.18783402389959766, 0.17804130526231446, 0.16571440027264892, 0.15607213468336228, 0.14909403623855047, 0.13943052620988028, 0.13286671091534424, 0.12336844630114534, 0.11497454807807928, 0.10545922916873081, 0.10132273539270589, 0.09354612064639165, 0.0873131498593011, 0.08167278710894388, 0.07457633869008504, 0.0708185337430658, 0.06378851806674798, 0.06256385600096159, 0.05628243402993448, 0.0543891785261378, 0.04935605151587873, 0.04448885779954032, 0.04303311470164774, 0.036695783973515216, 0.037484596732519776, 0.03342892092967293, 0.031852812449343494, 0.030657287404510916, 0.028537146285371462, 0.026141681458770372, 0.02237731472223333, 0.02159141168429094, 0.01810596079370783, 0.01772786523613757, 0.018340470227034014, 0.017084740311947257, 0.015311350895171499, 0.012821536986739096, 0.012563015123629671, 0.011928508736934493, 0.009947958366693354, 0.010133919648211073, 0.008136139361595006, 0.008762649953092876, 0.007577565632458234, 0.007528509435866384, 0.006429840851454702, 0.006002020482142503, 0.005663301804308084, 0.005763976146313249, 0.005235182027880854, 0.005180414433154652, 0.004380829329349537, 0.004249376558603492, 0.0036437165909227413, 0.003767882329236349, 0.0026683659245688796, 0.0029292788394476217, 0.0024571485187753887, 0.0025381725157886323, 0.0020632186210488364, 0.0023798479317508016, 0.0019010645961738573, 0.0016593030927010656, 0.001335725677830941, 0.0015541426985568674, 0.001362943958951335, 0.0012478866435874727, 0.0013770805891509998, 0.0012274629748873149, 0.0010553984627026166, 8.622764097216652E-4, 7.001540338874553E-4, 8.197376839411388E-4, 6.771154880210304E-4, 5.626670417780279E-4, 3.993929227574087E-4, 4.2348955392433656E-4, 5.81896984168389E-4, 5.196258693740507E-4, 5.198856251624642E-4, 3.8083784325516136E-4, 3.2114971598321993E-4, 1.789086571911341E-4, 4.015983614786852E-4, 3.7988603418974307E-4, 2.4003840614498319E-4, 3.0057108506161706E-4, 2.0085564504790406E-4, 1.790047336807351E-4, 1.8044750982436442E-4, 2.2017173395248293E-4, 1.408252358822701E-4, 2.4004320777739992E-4, 1.7993522331960493E-4, 5.975024398016292E-5, 1.7867778439547348E-4, 9.911588629425525E-5, 1.0010210414622915E-4, 8.048451679108231E-5, 2.0048115477145148E-5, 2.3888678756992416E-4, 0.0, 3.989626969878316E-5, 6.05229180116204E-5, 8.023267475679471E-5, 5.9883825378765195E-5, 1.200240048009602E-4, 3.994328054163088E-5, 7.998240387114835E-5, 5.979788315493632E-5, 1.0045203415369161E-4, 1.9964064683569574E-5, 2.0028440385347193E-5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 6.023733510029516E-5, 1.9972438035510995E-5, 7.97225654721569E-5, 0.0, 0.0, 0.0, 0.0, 0.0, 7.956873744305863E-5, 1.998920582885242E-5, 1.992468469186475E-5, 0.0, 1.9877159156413366E-5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.98358761900968E-5, 0.0, 0.0, 0.0, 0.0, 3.9850957419252E-5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
prRand = [0.0, 0.08246125579166001, 0.13709387363625464, 0.20131251864373073, 0.23322959542214636, 0.24642935399693233, 0.2777275376298708, 0.2966096609660966, 0.30541832509950595, 0.31357430995767344, 0.30792994844430177, 0.30721972373915835, 0.2944946755073337, 0.2969758268433296, 0.2878018551095474, 0.2776916348600509, 0.2634368811633629, 0.2618033475313456, 0.2557341052001198, 0.2487307599323072, 0.23349506840598155, 0.22855414398064125, 0.20489546760293648, 0.19384425609804623, 0.19092325516359715, 0.1790067855641626, 0.16978826545942588, 0.16048194703394078, 0.15417490463922673, 0.1452941882324707, 0.13902807123453065, 0.129367042780426, 0.12238901437166444, 0.11164776143332399, 0.10252650351728922, 0.0974890106581562, 0.09264277827963464, 0.08607579779272358, 0.08193365841911986, 0.07340143776012108, 0.06768567665722154, 0.06612809694255034, 0.06112146162629966, 0.057684986675749866, 0.054328790837174665, 0.04991600671946244, 0.04530828420105926, 0.04151335786274196, 0.03847074308962546, 0.03639146162101999, 0.03639681552930796, 0.03298751823634301, 0.03126196762945196, 0.028397160283971604, 0.026383734064870098, 0.023337199536055675, 0.021249648184632704, 0.019742883379247015, 0.019171763762157828, 0.01870404783065363, 0.016220453449107573, 0.015210882713444653, 0.012941364435213293, 0.012783067936304713, 0.011310141227160297, 0.010908726981585268, 0.008994603238057166, 0.00932433793172893, 0.009121938561647938, 0.008174224343675417, 0.008900999091734786, 0.007068831246630324, 0.005843551294495176, 0.00518639217868214, 0.005365085063523405, 0.005395647377394444, 0.004480358428674294, 0.0036136794928735816, 0.003830423940149626, 0.0036036757492642494, 0.0031634092282893413, 0.003464893066231232, 0.0025705916346173007, 0.0025165956603586644, 0.0022583739707410662, 0.002123312367292977, 0.0025411935542423813, 0.0018810533898983431, 0.0014793786609623959, 0.002033492822966507, 0.0018568977697043091, 0.0014832037200352762, 0.001751066741808228, 0.001277292140661797, 0.001146973599484868, 8.960930343701462E-4, 9.6254110852651E-4, 0.0010002200484106503, 7.597568777991043E-4, 8.563519407324796E-4, 6.832385507304624E-4, 3.19514338205927E-4, 5.64652738565782E-4, 7.02289463651504E-4, 4.7965464865296986E-4, 2.599428125812321E-4, 3.8083784325516136E-4, 4.2150900222797614E-4, 2.5842361594274925E-4, 2.6103893496114535E-4, 2.199340197940618E-4, 3.200512081933109E-4, 1.4026650636208798E-4, 3.414545965814369E-4, 1.790047336807351E-4, 3.408452963349106E-4, 1.200936730649907E-4, 1.207073450419458E-4, 2.2003960712928326E-4, 5.9978407773201646E-5, 1.5933398394710112E-4, 9.926543577526305E-5, 1.7840859532965945E-4, 1.2012252497547498E-4, 1.006056459888529E-4, 1.4033680834001604E-4, 1.1944339378496208E-4, 0.0, 3.989626969878316E-5, 6.05229180116204E-5, 6.017450606759603E-5, 3.992255025251013E-5, 1.0002000400080016E-4, 9.985820135407722E-5, 1.9995600967787088E-5, 5.979788315493632E-5, 6.027122049221497E-5, 5.9892194050708724E-5, 2.0028440385347193E-5, 6.0091338835029246E-5, 5.9992800863896336E-5, 5.9541530217326585E-5, 7.933989209774674E-5, 4.01074880680223E-5, 0.0, 0.0, 1.9972438035510995E-5, 1.9930641368039225E-5, 0.0, 3.985175148447774E-5, 4.043262913170929E-5, 1.9943758600745896E-5, 0.0, 1.9892184360764656E-5, 0.0, 0.0, 0.0, 9.938579578206683E-5, 0.0, 0.0, 1.996725370392556E-5, 0.0, 0.0, 0.0, 1.9872024164381385E-5, 0.0, 0.0, 0.0, 0.0, 0.0, 1.9925478709626E-5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
plot(n,prFix,'--','Linewidth',2);
hold on
plot(n,prRand,'--','Linewidth',2);
legend("PRfix","PRtheor");
xlabel('N');
ylabel('Pr');




