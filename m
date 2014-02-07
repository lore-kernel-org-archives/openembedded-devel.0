Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3205B6E8CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2014 18:59:10 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id 11so2899822vbe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Feb 2014 10:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=5OWz9ufdcMMeOqiNhicI4j8D2/ZVs6p35NHe/uLZxFg=;
	b=ldzkCv8qU9OwLyhmWC/8oCH1/FFzcXXBHl+hZAZTUs1C+gBodtvo8bhobRFiaijSlr
	R5oer7Rcpc9003/3cVflazQfsxR1f4GC+sPVORd+tgWWRLEN9eS8AikCVZX9YCKRy9H1
	/UQvoa+JSBq7NLE4PZpIZ+vC/OBjA6aU3iaQpP/o+GS+E9jj4AV78V/eJ1O7/v2UGdZ5
	GLR2xeCxRsjAmwdFEbHHQv/U3tJm5+b/3Oi4kujTLJaxrdWTOO8w2eK+SdiXJ/XrzI2z
	jbUuDYxolYqf4qTl1GLJGqt9meNlFWud97nlEZwfhGOGar8sXZZ21V9kRa5bAOuGV8UX
	zDKQ==
MIME-Version: 1.0
X-Received: by 10.58.86.230 with SMTP id s6mr11611166vez.16.1391799550496;
	Fri, 07 Feb 2014 10:59:10 -0800 (PST)
Received: by 10.52.182.68 with HTTP; Fri, 7 Feb 2014 10:59:10 -0800 (PST)
Date: Fri, 7 Feb 2014 10:59:10 -0800
Message-ID: <CAFeBWL5iManz=rkRY+FZ4aK-6+KdwZRBhQnso6HiLP32yFF7Gw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: dbus-daemon-proxy repository has disappeared
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
X-List-Received-Date: Fri, 07 Feb 2014 18:59:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Good day y'all,

I am tracking refs/heads/dora and this morning I got a fetch failure on
dbus-daemon-proxy (git://
git.collabora.co.uk/git/user/alban/dbus-daemon-proxy). No available
mirrors, so I am build blocked.

Anyone figured this out?

Thanks!

Adam

