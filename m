Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2057879DC6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 00:28:25 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id l9-v6so19305758qtj.12
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 17:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=4P4FMvUNxxy8p0ZbxKc2kaAREM53/phR/zDHZt5Eda8=;
	b=ehF0Z3qzDX79WnCxBH1xnDjnVpJGMoQAvSrCJOck9JGsqHA3CVkM+LVvPHfbldEty2
	KLo//z9FqLCoUk1DSups9FiJaz+cjcGkX+0X6cbdL9A2gR+GX8DFJ5tqADS8Ao8iC0zL
	lK+9weZFMBIpJJqxyBjFhtUF7GSquH5HoNXK/SG1u88hGo7wNN1O1AwCZ0ginbccK5zZ
	9f8zM7mMWQJCmefLmd6CZmCo7roDCkvz7JWtMqD9n1cGIfxRxW2b8Fopt7poDyz6asBF
	9JKcfIRQJun772DXC8Za7QsRHPycGhUPft6qWd0yiQZ7/p4bNJArwwnqZOUekVmgQCDi
	fl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=4P4FMvUNxxy8p0ZbxKc2kaAREM53/phR/zDHZt5Eda8=;
	b=PqZfDspsPq6R1ff2qpE6am3NmNQr08cZbfLZbH7M5oHUQKo25dya/DSauM6OjDcP0j
	PGQTBFW1xEWYn6X1CxpaRhb9FJHLNhkTgsyCm1/0a1j11fSbe+TYZBxVEoVm7/HPwMn4
	+1Vo6iSXnI+cYljxvqpltbh7zi3euXLZJHcxnAcXADTw9J/Lcqc8j6QMKgqXPFEVgVjo
	r+Z3Af7+0EPDJbF2FPJkTSSdyZ6qhqfXVu+Jott6HJZhI9KtKxgI5miNBSxhXumWESR2
	PTv2FnttZRqKdgAumHeYFt/HfHlFe62YjDC01KUZZ5RjI58DVc691TQZgJHoQXzUq/RV
	fbuQ==
X-Gm-Message-State: AGRZ1gJWN5wvIiw4Ssm71x9wH5F98Z5Lf+LxXkdXihwm0uYaTDkVT1HZ
	Sph1ps1FQnGSEPPKz7YBNC/mztHxHtrqpkgMBkRYN+gL
X-Google-Smtp-Source: AJdET5e6cKq0F8tMpv/fzHPe7eqB34LRfwWJasxByxudfozIKb70JXiu8uuD5sVoKl1Y0lvSMf28klXyJj1zsY6q8mQ=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr134313qtk.253.1541032106591; 
	Wed, 31 Oct 2018 17:28:26 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Oct 2018 17:28:00 -0700
Message-ID: <CAMKF1spz60VvQvH2AvzEVE7fBC-GCam=wOQr=SuaZiBNFdk8Fg@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Thud branch has been created
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
X-List-Received-Date: Thu, 01 Nov 2018 00:28:26 -0000
Content-Type: text/plain; charset="UTF-8"

Dear Friends

We now have thud ( 2.6 ) branched out for few days now if you have not
already noticed.
So far the master and thud branches are similar, so if you have
patches that you want to include into thud release please mark it so
and CC Armin for ack, as official release maintainer
for thud, Please include the branch in your thud testing if you have
been doing so,

I will keep master in sync with thud for couple of weeks while holding
the patches like gnome3 in
master-next until then, so we can easily do needed backports into
release branches.

Thanks
-Khem

