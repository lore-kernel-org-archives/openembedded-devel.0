Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id D445A6D96B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 03:07:14 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id lc6so1326803vcb.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 19:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Avw4YRcPL+xoRKcUyin/FrJZhhOgG8HSRqzZmwGsxK8=;
	b=VsWbKUaa6ndwcY4FEfsBvUh3ykEvn2SX5OjvS6gBf7WY6gB4FlTUCgZQaHK7Cbo28t
	qcA2rNWy6X2P3h69NhSB8VKi4I4+iQdFUIoMKzjmS9Vhy/U/1TqDCcXjcVq/oxPH4e7k
	NNPBcB/WLX4zu/4wlg9l8qMva8sMlB5uZzkHAFkXb9hp4ps/KVXX/MjGlJbg9TTIaV7x
	YilCU9M3655OnVAzd1Ar8sYvbVk/QWeAJWhztlZzc2yUB9dDHT0hzZvjm4Z7yNM/Plp3
	uhKcW4YF7Xb8phNO0+DnWj/MdYG5VNVgVGpbAUbAtPEAFK8vGHPXtzDIh5/zFcrNktOM
	EnZg==
MIME-Version: 1.0
X-Received: by 10.52.157.232 with SMTP id wp8mr27447991vdb.4.1384312035821;
	Tue, 12 Nov 2013 19:07:15 -0800 (PST)
Received: by 10.52.187.132 with HTTP; Tue, 12 Nov 2013 19:07:15 -0800 (PST)
Date: Tue, 12 Nov 2013 19:07:15 -0800
Message-ID: <CAFeBWL4xeq+4cL9gvnCDSU1Va8edf+1zT+G7BfYto7Yvp8HXXQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: libmpd-11.8.17 gets 404 Not Found
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
X-List-Received-Date: Wed, 13 Nov 2013 03:07:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello everyone, my first post here. Not sure if I am posting at the right
place.
I am updating my meta layer to Dora from Dylan. At the moment,
libmpd-11.8.17 is getting 404 Not Found. It is here -
http://downloads.sourceforge.net/musicpd/libmpd/11.8.17/libmpd-11.8.17.tar.gz
.

Not sure if it's a temporary issue. Anyone else ran into this?

Adam

