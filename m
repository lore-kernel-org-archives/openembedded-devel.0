Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Owvbu-00005P-RP
	for openembedded-devel@openembedded.org; Sat, 18 Sep 2010 13:29:41 +0200
Received: by iwn2 with SMTP id 2so2733168iwn.6
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Sep 2010 04:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=qSF0gapq3tCOHIeP7eqpIJOR4xz3C2yakdV7+5mIpuk=;
	b=JGq9E8rfWEKC9dfED4+fL1VtnRksYmrNqstfngdrhp/ZSGx0N/3GWVd200W6KzBr4i
	Y8kwHXyyLsa7iQblZu1pl+pmQgDkDUaPrGMqz0Xixh9sSN4hs/kL+HA/eVVPhQCKhx2U
	E5Ff2QV6Aysatu5TJ2mS7byJFuAX4uPENm1MM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=PVC+at9Lc4gZYSRD8pgVckyN8L1Fm/aTxaBdnqD+U/ShsFgrGSuAAhYKJYJpd70hIP
	2y9oaV7+kFeDss5o9mpwFDeSMMAwYdUqQ69R+h5Mekar3s5EquGNVIeb/ea0WvirFESE
	u96V1SawUTeGH73hCTFTAw8S8qUob4kt4XLIc=
MIME-Version: 1.0
Received: by 10.231.148.195 with SMTP id q3mr6684392ibv.199.1284809327232;
	Sat, 18 Sep 2010 04:28:47 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Sat, 18 Sep 2010 04:28:47 -0700 (PDT)
Date: Sat, 18 Sep 2010 13:28:47 +0200
Message-ID: <AANLkTinBaSVr_fd0TXnTjFk1LcJ2nGm9hgHGzkVg7riX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: svn://svn.om.vptt.ch issue
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
X-List-Received-Date: Sat, 18 Sep 2010 11:29:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Not sure if this is permanent but the following 5 recipes did not fetch for me:

/home/frans/oe/openembedded/recipes/e17/bubble-keyboard_svn.bb
/home/frans/oe/openembedded/recipes/e17/essential-dialer_svn.bb
/home/frans/oe/openembedded/recipes/e17/gridpad_svn.bb
/home/frans/oe/openembedded/recipes/e17/intuition_svn.bb
/home/frans/oe/openembedded/recipes/efl1/libefso_svn.bb

These all fetch from svn.om.vptt.ch

Anyone any idea on this?

Frans


