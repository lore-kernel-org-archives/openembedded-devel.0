Return-Path: <sebastientaylor@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id EF72A6FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2016 17:31:14 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id e127so35226158pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2016 09:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:user-agent:date:subject:from:to:message-id:thread-topic
	:mime-version:content-type:content-transfer-encoding;
	bh=N2LWnLdS2AKEKdbhgBmG6Y12HmXvszXjxZjZYpcd6q0=;
	b=PoDDQ1A9Vf/rprg5ds7BEDYoO5+GiXtrA5MOnWfFSjFdfdY2IvBJdq5L5aUbkvmzc4
	ogp1cecEQjQxOswI/Egm/1VqESRKKxaMd8bVW2F6vgiRJJFvD05zXGkMLbiM5q5DOFPv
	dLnTdHBQus9tBSDyDgWOGnJXXGXgVzG7d7uhoqAK0iSSW3EMkkQiT8iCwaEaVjfs6EhC
	Sp1RNs5Wp/FGaB6uPYxavzxI6BqctJjqCnSQSL1nPVtqvFbM8LiV7+bzPNyS9equeygq
	rRBnx0faID8XUZrzn7CBzAihCID1HvbM7NyNwedG2++JPEdFTodO76z9wcAY2/sjSrIM
	v1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:user-agent:date:subject:from:to
	:message-id:thread-topic:mime-version:content-type
	:content-transfer-encoding;
	bh=N2LWnLdS2AKEKdbhgBmG6Y12HmXvszXjxZjZYpcd6q0=;
	b=Ly42h05N5/PVIgh91+tuxRyWcTxWdJamvAAmI93mDOArlzPkHBiTXnFrGvCWoTPNIq
	0BCvsqiUFJg9GfWxJN5hsLsaZJD9Tc2MXrTMso6y6gRNWTqX+SHvGBbuEP6VVngv0kaq
	iEjWKny8gGaos7cdZR7MExHpLmD3I3hjvAcrOxgcEvGj4G831vr7bBC2VqlmugR79DJy
	7W1FgGjV83TSENoh/57a6klNvtetsrOCG2V2iewNbbrLC/zghetVAm7B2RElBdJme0FK
	gF6nWswQDYxk6JVs6nPC1oY8xTfcUh9X7Nhix+VgoUqFoRP30bQk0ta/zYPyYvps3Tmt
	9XiQ==
X-Gm-Message-State: AG10YOQRjSfSKKybZ+I/wp6f6QOFOsVMHER3MZ6SXeNNpphjezDqKHH8JVaAt/HgF/x8LQ==
X-Received: by 10.98.76.80 with SMTP id z77mr52131614pfa.121.1455039075151;
	Tue, 09 Feb 2016 09:31:15 -0800 (PST)
Received: from [192.168.1.186] (mail.au-zone.com. [184.70.109.50])
	by smtp.gmail.com with ESMTPSA id
	s90sm46417494pfa.49.2016.02.09.09.31.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Feb 2016 09:31:14 -0800 (PST)
Sender: =?UTF-8?Q?S=C3=A9bastien_Taylor?= <sebastientaylor@gmail.com>
User-Agent: Microsoft-MacOutlook/0.0.0.160109
Date: Tue, 09 Feb 2016 10:31:14 -0700
From: =?UTF-8?B?U8OpYmFzdGllbg==?= Taylor <me@staylor.ca>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <EC3D8C09-AC4A-40D6-A828-6B6E0CC34678@staylor.ca>
Thread-Topic: [meta-qt5] Commercial License
Mime-version: 1.0
Subject: [meta-qt5] Commercial License
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Feb 2016 17:31:15 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

I am looking to update the qt5 build to build the commercial version (as opposed to the open source) as well as adding the QtCharts and Visualization modules which are part of the commercial release.

I was hoping for some feedback as to whether this has already been looked at and opinions on how to best handle toggling the license in the configuration in a way that can be submitted back into meta-qt5.



