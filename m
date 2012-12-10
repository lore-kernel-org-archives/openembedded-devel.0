Received: from mail-ie0-f170.google.com ([209.85.223.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1Ti7kf-0006ML-BM
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2012 19:06:51 +0100
Received: by mail-ie0-f170.google.com with SMTP id k10so9040562iea.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 09:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type:content-transfer-encoding;
	bh=h8Slp3O31L2vXRFDAuv/8oImKDUiJUivEvBaqhLEmSE=;
	b=B9wfbbpHDC7s52c+I5W/SQ6rUsN1Zraq69SHRe5bPN1SFtLzj/hoXxJr2q4g+niny1
	Yq2PpDZYkcvUoGCKF/cTZ+/xHrKhQVJzwrAgU5A63arWzEOYrDEtNhgCsAFCcG/QVwG0
	eD8Yfm5S2+o3/LlTm+nAhJr1hpqRoVMTqcW8soAlJlmRd5zBTPaotJSGXkBNyOb5Kcny
	eFcrz/2OB+MBnZUGdzWRA3Gr4acPKzH/zf9a/lXlRrQA7Kb6MZJ2FTAnEB8rMRrtgGIA
	jTAKpKeDpsbqH7TwP1uuSar+DsLVADkgHlfrkfJcW91Qtln/FoWlqMlIdRJqQ5nh80B6
	fc8Q==
Received: by 10.50.152.236 with SMTP id vb12mr7381732igb.15.1355161937755;
	Mon, 10 Dec 2012 09:52:17 -0800 (PST)
Received: from cl-t066-141cl.privatedns.com.gmail.com (wkit.com.br.
	[67.205.85.241])
	by mx.google.com with ESMTPS id bg10sm6452818igc.6.2012.12.10.09.52.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 09:52:16 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>
References: <CAP9ODKp6urgcSXNyfzsQhUnEDXoE_R4G0DhWS5iu7fS5OqW9Rw@mail.gmail.com>
	<20121210124359.15b4543e@eb-e6520>
Date: Mon, 10 Dec 2012 12:39:13 -0500
In-Reply-To: <20121210124359.15b4543e@eb-e6520> ("Eric
	\=\?utf-8\?Q\?B\=C3\=A9na\?\=
	\=\?utf-8\?Q\?rd\=22's\?\= message of
	"Mon, 10 Dec 2012 12:43:59 +0100")
Message-ID: <85r4mx958e.fsf@cl-t066-141cl.privatedns.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br
Subject: Re: [for-danny] Hashes for backporting to danny
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
X-List-Received-Date: Mon, 10 Dec 2012 18:06:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Mon, 10 Dec 2012 12:43:59 +0100 Eric B=C3=A9nard <eric@eukrea.com> wrote:

> Le Tue, 4 Dec 2012 10:11:10 -0200,
> Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :
>> Here goes the list of patches we'd like to have backported to danny so we
>> can use danny branch for one product at O.S. Systems:
>>=20
>>  * freerdp: disable man pages generation
>> (638f02695550bee4f941439cc2d1293c599b4a1f)
>>=20
>>  * freerdp: update to the latest commit (2012-11-20) in the stable-1.0
>> branch (e7e3fd797b46a85ffc03cc7c4b2267d686476f93)
>>=20
>>  * openbox: separate package for configuration files (openbox-config)
>> (3becce8504033dfac7c497fa12675f873a5df9e0)
>>=20
>>  * xinput-calibrator: update to 2012 Aug 2nd's git snapshot
>> (3cd0866c28822d08e5817d4d806b8deaa368c711)
>>=20
>>  * xinput-calibrator: update meta-systemd's bbappend to 2012 Aug 2nd's g=
it
>> snapshot (23c9e5d6c4f66df8604c42a19e343d952784fc46)
>>=20
> pushed to danny-next, please check the result is what you expect.

Thank you.  I've build those packages out of a freshly-cloned danny-next
branch and everything went smoothly.

Maybe the patch
http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-December/04281=
1.html
should be applied too.

Best wishes.
Mario


