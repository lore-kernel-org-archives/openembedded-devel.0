Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lazy.gopher@gmail.com>) id 1Q0sx0-0007AF-Mn
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 11:00:02 +0100
Received: by fxm19 with SMTP id 19so4275188fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 02:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=MEaFp9Tf7MOC+lPr2kzhaFeXILtA6p3fKQ1FdYaUMQw=;
	b=COJCoBaANuGNg3DnkEZ2tO0UbpomW7Ut9ZxkXjQN0bpT+NWcKaN8/LuH8qXPd3577P
	v0XBP6EjhDR9nKT7qNHbV73GDb3tT9tvhezmzvzFW4ZbYSA0Xfypf/R2fQrXyx+uROqZ
	7D6oeNjNIUS143bqAH1GkTdvRauY4L6u4xOok=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Xhq9DZzIZ3NHfd+t7sGdmpEMmQP10UtmZoU09kAzp3F2ux18FfnyTHGmDc8hW+sgWs
	0PoYHM3rzA+KGPUZH5WaMbeUQqycw+12UW2JtvD8OC5W3iVjrknMDP7rHMqddv/xxyKr
	YxreVGlNt7D+5UW5Nx0Z2m1nt3yG1f9pUHHY8=
MIME-Version: 1.0
Received: by 10.223.16.82 with SMTP id n18mr2388679faa.48.1300528696367; Sat,
	19 Mar 2011 02:58:16 -0700 (PDT)
Received: by 10.223.70.135 with HTTP; Sat, 19 Mar 2011 02:58:16 -0700 (PDT)
Date: Sat, 19 Mar 2011 10:58:16 +0100
Message-ID: <AANLkTimm0B4bFuDgSJ1k+CUG_65Qm2QDeSxEkxWO79fA@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: cmake in stable
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
X-List-Received-Date: Sat, 19 Mar 2011 10:00:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi everyone,

could someone, please, cherry-pick following commits to the
2011.03-maintenance branch as the cmake is broken in this branch.

7ce3543709765f37e359b2fa449216c834a5910e
37a042ec115f100a0aef606ee7f88cad560f0d1e

Thanks in advance,
Maksym.


