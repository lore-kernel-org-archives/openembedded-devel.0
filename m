Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1PvdlB-0008PT-2a
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 23:46:09 +0100
Received: by fxm8 with SMTP id 8so2641728fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 14:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=Zmff6qC0M2TkW+zBmAFoDaOQ/kQqnyMojR7IXps3+1c=;
	b=X/GmP5TLu8miC/gR90Wj7DunMaNUc8TxX5sjbYvFVB6ZR+b1LMWPuWIc7WnOlSNL6j
	Yflt8csv6/M9S95WJTU05QRGJiJ5CNAU6uvDlKDj9014QgjkZJRg542ZpK9fAK4McNFn
	/tAZN16KLljwi0I9P6LXVpdzIHqGIN90W6z6w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Lua0x+nuSZMh1VMSHNwnrZouX63nsreDWaZg/ZKTqhknPpNdC/SIbw6raKZDsWGvYA
	GktihnrH1arpFpC6LQl1mpN2p2yPTBmN5d6zi4ZvgFM+o8LoxSVChXbNdTz5nueOoUfz
	JBisAUI5yMgXqdqo7lwJ4bnRcVOLpTZ8WuFi8=
MIME-Version: 1.0
Received: by 10.223.16.148 with SMTP id o20mr1468931faa.149.1299278677450;
	Fri, 04 Mar 2011 14:44:37 -0800 (PST)
Received: by 10.223.156.193 with HTTP; Fri, 4 Mar 2011 14:44:37 -0800 (PST)
Date: Fri, 4 Mar 2011 23:44:37 +0100
Message-ID: <AANLkTi=zMn-PrjAFc6JTiJRhHHPodvtYDV5kakKdd0bu@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [BRANCH REMOVAL REQUEST] likewise/nios2 and nios2
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
X-List-Received-Date: Fri, 04 Mar 2011 22:46:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

please remove these branches started by me. These contain work started
by Walter Goossens to commit NIOS2 support to OE. As I lost access to
actual hardware, I could not finish the merge. Frans Meulenbroeks has
followed up the commit and test effort independently.

These branches have therefore become useless:

remotes/origin/likewise/nios2
remotes/origin/nios2

Thanks,
-- 
Leon


