plot(Thruster_Array(:,1),'r')
hold on
plot(Thruster_Array(:,2),'b')
hold on
plot(Thruster_Array(:,3),'y')
hold on
plot(Thruster_Array(:,4),'g')
hold on
plot(Thruster_Array(:,5),'k')
hold on
plot(Thruster_Array(:,6),'m')
hold on

legend('X+','X-','Y+','Y-','Z+','Z-')

title('Number of Micro Thruster Required for Ignition at Each Time Point')
xlabel('Timeline') % x-axis label
ylabel('Micro Thrusters') % y-axis label