Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TfrZ7-0005WB-U4
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 13:25:34 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2432353pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 04:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type;
	bh=+qn0wrE2XmvQjmdhzD46/Gzpb0dTFDSHuSvuCFnnZQ0=;
	b=qYEI4MgmffebgN8TmOv1Sz3teyCzRTPpUOlHgPQ1Apz7j47OptiE25BAVZ+AgRclyz
	j+ihZ4IpHf8OTdw5jN06JwTLBD004xQqvt8x63pVsi8p48avhX5dtv3fpKq+gpm/GEo9
	Icnm10rbvRt2+qG75MUkS3ww39aGTG4GFDmTGwCcVctz0+uJ1u3WBmGtXOPHYJedjmP/
	xlG/j9DK8+Bd6sPfl0T5n7pAqUwXah1zzVlHeojEhQ2XXn2M4OAQc63Amo4YxXKd/KP8
	x/Yw3gbx1PL/dxHGeFOkHgcqbdFViRpYh20ijuPATDqeN2LBR8uFb/u0DGLdPSQWn5lo
	WLpA==
MIME-Version: 1.0
Received: by 10.68.234.98 with SMTP id ud2mr38176957pbc.136.1354623070685;
	Tue, 04 Dec 2012 04:11:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 4 Dec 2012 04:11:10 -0800 (PST)
Date: Tue, 4 Dec 2012 10:11:10 -0200
X-Google-Sender-Auth: KaNGuMbnConCwJHXHLCU7aHOuaA
Message-ID: <CAP9ODKp6urgcSXNyfzsQhUnEDXoE_R4G0DhWS5iu7fS5OqW9Rw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <ebenard@eukrea.com>,
	Mario Goulart <mario@ossystems.com.br>
Subject: [for-danny] Hashes for backporting to danny
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
X-List-Received-Date: Tue, 04 Dec 2012 12:25:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Here goes the list of patches we'd like to have backported to danny so we
can use danny branch for one product at O.S. Systems:

 * freerdp: disable man pages generation
(638f02695550bee4f941439cc2d1293c599b4a1f)

 * freerdp: update to the latest commit (2012-11-20) in the stable-1.0
branch (e7e3fd797b46a85ffc03cc7c4b2267d686476f93)

 * openbox: separate package for configuration files (openbox-config)
(3becce8504033dfac7c497fa12675f873a5df9e0)

 * xinput-calibrator: update to 2012 Aug 2nd's git snapshot
(3cd0866c28822d08e5817d4d806b8deaa368c711)

 * xinput-calibrator: update meta-systemd's bbappend to 2012 Aug 2nd's git
snapshot (23c9e5d6c4f66df8604c42a19e343d952784fc46)

Please apply those if there're no objections...

Regards,

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

