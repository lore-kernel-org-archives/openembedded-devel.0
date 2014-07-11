Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6C870373
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 14:54:37 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id j5so999260qga.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=5HsHesfjbji0kU59XDxzVw0xBcwJ6BZFzkH+h1ZfmFM=;
	b=qirZHYPJSrwrIZkqcmQhYexMNTNs+bO86cwm61Cix8WqWgV7lR3+jPdr/hCsyCyz8x
	CJbBytIcP4YP1N/TGLkEakhpp16l0K6Wr8plqPGuVA7/rBL7YOscoPAf6NmTPgQpEhX6
	uN7PPB7svM5Z5a2X5UtwOMzfXRdVAM2tdojBiZhnEePFhVsk72T+hiW4lN0r7SEnXiX4
	wUbDniwksy5RN3SftMj1taVF3NqtzIntvKsrKVLgH+ZaDMVuqI7lNzGuwo6vkbfXYSyc
	Y1cGbbV213th1/JqzKZfKC2dDjosKpHQ/qhmkya1R7qNXr4yCrtTD/5p3V/dCRUCmaQl
	iC2Q==
X-Received: by 10.140.44.33 with SMTP id f30mr87110794qga.89.1405090478140;
	Fri, 11 Jul 2014 07:54:38 -0700 (PDT)
Received: from localhost.localdomain
	(pool-71-171-41-171.ronkva.east.verizon.net. [71.171.41.171])
	by mx.google.com with ESMTPSA id m1sm4627598qaz.27.2014.07.11.07.54.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jul 2014 07:54:36 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Jul 2014 10:54:32 -0400
Message-Id: <1405090473-5413-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
Subject: (No subject)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jul 2014 14:54:43 -0000


I was trying to get this recipe into meta-oe before the daisy branch, but 
it had to wait on some other patches to get into oe-core.

Now that these are in place, it would be very helpful for people using
GNU Radio from daisy if this recipe was in the meta-oe/daisy.

Thanks,

Philip

