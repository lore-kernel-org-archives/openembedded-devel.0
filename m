Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RseQd-0000nP-En
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 18:57:07 +0100
Received: by lahc1 with SMTP id c1so792937lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 09:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Z2DvkWLqhQJp/dqiQ3wjgRphArwjhY8FU76dBRrzJ1Q=;
	b=RJBSWgu4rjn4uiH5O5pFhQkTNDKp7nA7bpeZoIZkyX/E2zQqzDjKo5pRUoLEFsAVV+
	r4fOfD0ZHAveld1/5xFy0yla0j1m0zp8JpkhnPiKqn0yXzU0oUp1wDrXaC0gUk6Ajjge
	abJzst/MaleiCYPLLcSl9D129b/jlb6fDlGy8=
Received: by 10.112.28.169 with SMTP id c9mr1810396lbh.42.1328118552306; Wed,
	01 Feb 2012 09:49:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 1 Feb 2012 09:48:42 -0800 (PST)
In-Reply-To: <4F291A06.4000406@gmail.com>
References: <4F291A06.4000406@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Feb 2012 09:48:42 -0800
Message-ID: <CAMKF1so7cMo0qiOPLuJrpk7kNuyk3dYEEZpM8nSGFKXMuUdoGQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Can't build openembedded: fail in picosam9_git.bb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2012 17:57:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/2/1 =D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4 =D0=A2=D0=B8=D1=82=D0=BE=D0=
=B2 <leonid.titov@gmail.com>:
> I've got a problem with building console-image for MACHINE=3Dpicosam9. It
> fails while processing picosam9_git.bb with these messages:

do you have machine conf file for picosam9 ?
recipes and machine confs  are different files.
you have to show us both files here. That said
your error is a fetching error which means something
is wrong with either your SRC_URI or the remote server
which is feeding the sources of this recipe


