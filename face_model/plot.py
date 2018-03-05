import pandas as pd
import matplotlib.pyplot as plt

train_log = pd.read_csv("caffe.log.train")
train_log1 = pd.read_csv("caffe1.log.train")

_, ax1 = plt.subplots()
ax1.set_title("train loss and test loss")
ax1.plot(train_log["NumIters"], train_log["center_loss"], alpha=0.5)
ax1.plot(train_log["NumIters"], train_log["softmax_loss"], 'g')
ax1.plot(train_log["NumIters"], train_log["LearningRate"]*1000, 'r')

ax1.plot(train_log1["NumIters"], train_log1["center_loss"], alpha=0.5)
ax1.plot(train_log1["NumIters"], train_log1["softmax_loss"], 'g')
ax1.plot(train_log1["NumIters"], train_log1["LearningRate"]*1000, 'r')
ax1.set_xlabel('iteration')
ax1.set_ylabel('train loss')
plt.legend(loc='upper left')

ax2 = ax1.twinx()
ax2.set_ylabel('test accuracy')
plt.legend(loc='upper right')

plt.show()

print 'Done.'