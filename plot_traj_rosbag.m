clear all
close all
clc

% Imposta il percorso al tuo file .bag
bagFilePath = 'robot_position_.bag';

% Carica il file .bag
bag = rosbag(bagFilePath);

% Mostra i topic disponibili nel file .bag
bag.AvailableTopics

% Seleziona il topic desiderato
desiredTopic = '/fra2mo_position';

% Estrai i messaggi dal topic selezionato
bagSelection = select(bag, 'Topic', desiredTopic);

% Estrai i messaggi dal topic e convertili in oggetti MATLAB
msgs = readMessages(bagSelection, 'DataFormat', 'struct');

% Plotta i dati
figure;

for i = 1:numel(msgs)
    % Estrai le coordinate X, Y, Z direttamente dal messaggio
    X = msgs{i}.X;
    Y = msgs{i}.Y;
    Z = msgs{i}.Z;
    
    % Plotta la posizione
    plot3(X, Y, Z, 'b.');
    hold on;
end

xlabel('X');
ylabel('Y');
zlabel('Z');
title('Posizione da /fra2mo\_position');
hold off;