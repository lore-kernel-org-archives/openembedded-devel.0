Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3345F65CC1
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Jul 2014 22:12:39 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id eb12so3023478oac.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jul 2014 15:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=zGx+ZD4EAGIuJ4qX8MNv5vJG6r26pYlrPVgAebWJmFo=;
	b=rpDHpDtD9SEv/s88a3B0DYXTAwCsu02EJ2oOK4BpzwYCzqx5+ZFKcG+osqRb84lA3N
	3cQujh1CCyb/u4eLU0qtUvs+Qbk/Yj/XFBS5CoxI3lNg8uDJBxJsIEzno7g9wzFkxJ65
	+ENN23MXKunGvhj9ABe1sgylgEVS0R5VSoW9DupaIjUfXiQh/TAFyh/I0kedMWxtZ4Gv
	YMNwUpuPR8w5zxZtgs+CrIw9BWh99DSO83O7Qq6FfdXEuKST7ZZhzmqv9WtrWR5gXQ+L
	c1feOHx5OL407MLrRMK6S2CnUcFx52YwtKNb5KJSR8iBzm60OVuyEpf6aMdKsVLtye1U
	seKg==
MIME-Version: 1.0
X-Received: by 10.182.250.196 with SMTP id ze4mr21315936obc.46.1404598361175; 
	Sat, 05 Jul 2014 15:12:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.84.164 with HTTP; Sat, 5 Jul 2014 15:12:41 -0700 (PDT)
In-Reply-To: <90368C38-4B94-4896-A8CA-2B982448700D@staylor.ca>
References: <75D00F71-5F69-4506-9190-96C8BD98220F@staylor.ca>
	<90368C38-4B94-4896-A8CA-2B982448700D@staylor.ca>
Date: Sat, 5 Jul 2014 19:12:41 -0300
X-Google-Sender-Auth: 34rRPaQ9ZHhpvKF40GZXBBCmA2M
Message-ID: <CAP9ODKqbMvZ0E8OG1ZoE4EZ0W-iidAJnVSHbeV6JckFacPtAYg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] populate_sdk_qt5 qconfig.pri
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
X-List-Received-Date: Sat, 05 Jul 2014 22:12:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2014 at 1:01 PM, S=C3=A9bastien Taylor <me@staylor.ca> wrot=
e:
> Hasn't been any feedback on this so just curious if that's because this i=
sn't happening for others or they're simply not using features that trigger=
 this issue.  This makes using qmake with pkg-config (a good way to pull in=
 non-Qt modules into a project) unusable until the qconfig.pri file in the =
SDK installation is manually corrected.

Have you fix it?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

