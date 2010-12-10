Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PR5V9-0001th-2M
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 17:07:19 +0100
Received: by wyb40 with SMTP id 40so3739936wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Dec 2010 08:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=5fqRufQJiMRAFMeGQ6lo00HWppeAs26C+ttXTXUZWGU=;
	b=KmeIpFjPxxV7dfGSaoqhWKVSevtS/6rX4UKEWzJC5ewu9G1Raq0mE7GyovlF6TSxWy
	ru+CLhgeTfwx5I355z9/nxNECeuZh+LKCvp1vJTreKLZvjNQHXXG8215nYjrSY0u1uzO
	EVSx9A1/sSX9fjppPmVCP2y0xQJDOZVOwL2SQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Wq0iNuuKjROHUbNP4tdCMs9HghNnfrOOZj2AvLTrT2Ep3lwHKi+uKuq3JeJHJv0qcM
	Kb3kOBdweWEZulCmuruYIAn/9PJxN1oMY3KYQLAIpB51DBSoKOGgO9PFE7NpNmIYt25i
	iVlWNqe/W0g3ei0rNnBTzo/xA7lpRJeoaTGq4=
MIME-Version: 1.0
Received: by 10.216.169.71 with SMTP id m49mr873545wel.4.1291997146882; Fri,
	10 Dec 2010 08:05:46 -0800 (PST)
Received: by 10.216.229.96 with HTTP; Fri, 10 Dec 2010 08:05:46 -0800 (PST)
Date: Fri, 10 Dec 2010 11:05:46 -0500
Message-ID: <AANLkTinBFLqKJci1P1UZFx6FrrzK5gpm7unsjxEpZ8qk@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: testing branch 2010-12-10
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
X-List-Received-Date: Fri, 10 Dec 2010 16:07:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

We are resuming our weekly testing now that the 2010.12 release is
finished.  The testing-next branch has been synced with the master,
and is ready for builds.  Please update:

http://wiki.openembedded.org/index.php/Testing

with results.

Please do not push to the testing-next branch.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


