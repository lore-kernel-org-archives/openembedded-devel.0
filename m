Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Mk50S-0002hj-J2
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 01:49:20 +0200
Received: by bwz6 with SMTP id 6so1257544bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Sep 2009 16:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=EWiJ4mMo/zk3gVDg3JXf6dxpuVLwhN0vi9kqbzp2xvY=;
	b=hFKLHdovZJJkuzKimwPoD4bTy4Kh/FKT2HJDT0EoLJ/PNnaQ4nzXSykZu7Ypxk9PgD
	xhrjYZyIrcjaGRcVJptHmG5yLRC/TaSsNK50GNOg+T+yJ+Dzce1oQGR9NByqM/Y4buv2
	Ha1HuKWhxDj2ZYBNhFG1Vp2+HkPBwXeB/a5qU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=O30U7taAkUPDJbC4BZA3WIBHjQx/a9nwdDCAhahIMXnTAeMRXHna/vCuH8F3oEvRup
	enP5shFgS36JZImnXXMVRZ6Jeo/pnXHqaxmr3oNqv7imgN+V5Z0XduQFKilORYheQMq+
	xQff6L0+q1kCoulkLTdgllxj4YVVZY3KVOMXg=
MIME-Version: 1.0
Received: by 10.239.139.196 with SMTP id u4mr1228996hbu.114.1252193411879; 
	Sat, 05 Sep 2009 16:30:11 -0700 (PDT)
Date: Sun, 6 Sep 2009 01:30:11 +0200
Message-ID: <c384c5ea0909051630hb5a9c24jbf10e1854218b1d5@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	cbrake@bec-systems.com
Subject: Request for NEWS item: bitbake in GIT
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
X-List-Received-Date: Sat, 05 Sep 2009 23:49:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

For users not reading the mailing list, it is mostly unknown that
bitbake is now maintained in GIT.

I just modified the "Getting Started -> Bitbake
(http://wiki.openembedded.net/index.php/BitBake)" to reflect this to
some extend.

However, all other references to BitBake link to the bitbake project
page on berlios which mentions the SVN repo.

Maybe adding a News item in the wiki helps; I vaguely remember News is
moderated (cbrake?)

Thanks,
-- 
Leon


