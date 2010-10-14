Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P6VnD-0002nC-Cz
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 23:56:56 +0200
Received: by wyb40 with SMTP id 40so74382wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 14:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=MA++w+dhWJ/hVwJ09f/f0YtW0PRJnq2Y4ESW2BQy/p0=;
	b=bERckfrxinY5abDw1PYgC4img2uh80pKhiXwFK5m95hSN60RLU5RHPetM8k1yLZzPj
	DD5OdhLjoZafaV2ezGl1l13I4XcsitwMb2wJTcushkQvtv7CoHZlKZDWWoJxwk+1Ok08
	rjtofe3climUGsH8ZWc4alyeFjfH8fxDALtOs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=JmgkdUvVU8NPgqAKnt4j3ZHDd4ruXlMBjhYXDaZOe9Ar0ytTZcoQf6zRywRRN0w4mj
	YuKGVW7fYs1WNUA9BRWhsBIiPG956OkZF1gIRL+IP4OvXSK29OUCGYZUcoOv23d8ZWkG
	ylCblX/5r+0P6O+D+b73zQT7skNYVhY38T2Pg=
MIME-Version: 1.0
Received: by 10.216.167.205 with SMTP id i55mr651759wel.17.1287093384078; Thu,
	14 Oct 2010 14:56:24 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Thu, 14 Oct 2010 14:56:24 -0700 (PDT)
Date: Thu, 14 Oct 2010 17:56:24 -0400
Message-ID: <AANLkTini++RBtxheY+RZ2+7X-=i4NAbY39e2wcRA8mDh@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: testing branch 2010-10-14
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
X-List-Received-Date: Thu, 14 Oct 2010 21:56:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

master has been merged to the testing-next branch and is now ready for
clean builds.  I'll finish tagging and updating the testing branch
later today.  It looks like enough things passed to justify moving the
testing branch to testing_2010-10-08.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


