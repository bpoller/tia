var skeletons = {1:{"head":[23.0,23.0,23.0],
					"neck":[23.0,23.0,23.0],
					"left_hand":[23.0,23.0,23.0],
					"right_hand":[23.0,23.0,23.0],
					"left_elbow":[23.0,23.0,23.0],
					"right_elbow":[23.0,23.0,23.0],
					"left_shoulder":[23.0,23.0,23.0],
					"right_shoulder":[23.0,23.0,23.0],
					"torso":[23.0,23.0,23.0],
					"left_hip":[23.0,23.0,23.0],
					"right_hip":[23.0,23.0,23.0],
					"left_knee":[23.0,23.0,23.0],
					"right_knee":[23.0,23.0,23.0],
					"left_foot":[23.0,23.0,23.0],
					"right_foot":[23.0,23.0,23.0]},
				 2:{"head":[23.0,23.0,23.0],
					"neck":[23.0,23.0,23.0],
					"left_hand":[23.0,23.0,23.0],
					"right_hand":[23.0,23.0,23.0],
					"left_elbow":[23.0,23.0,23.0],
					"right_elbow":[23.0,23.0,23.0],
					"left_shoulder":[23.0,23.0,23.0],
					"right_shoulder":[23.0,23.0,23.0],
					"torso":[23.0,23.0,23.0],
					"left_hip":[23.0,23.0,23.0],
					"right_hip":[23.0,23.0,23.0],
					"left_knee":[23.0,23.0,23.0],
					"right_knee":[23.0,23.0,23.0],
					"left_foot":[23.0,23.0,23.0],
					"right_foot":[23.0,23.0,23.0]}
				}

var socket = io.connect(document.location.host);

function sendEvent()
{
	skeletons[1].head[0] = skeletons[1].head[0] +5;
	socket.emit('bcSkeletonChanged',skeletons);
};