Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1OZmGa-0007Rb-Ti
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 16:51:59 +0200
Received: by wye20 with SMTP id 20so2015001wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=q2VMTbVePM6Bu5GJSPjMGWmTjyBoRq5KQzNnuSZ+ZQI=;
	b=RBut1Jlw/yQZg9abpir5RXv/d2GXqerqF1Es2bXB+k6CqntMadQLovUmZ++kZGPzW/
	i/dEYXNeowDe7JnSk6NuaR4cBJ4AW2kDukdhrBzD4O1jf+b06myJCZFlD2HHvSDkxkUU
	RX2jgyVB1KUBzG5Xj7bJ0C049KX8ewkrAPbr8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=tKJagal3TxIB4Eh9tbDD0+DjVumByIMn8cvCeTc6LOTaCHVwhH6hjCh0/UO9CVQt0W
	agI3g9ZqxDKfZ3TEhhoFe2fQM/C+6xdW2zpUEgI9bVXg8JWt9MYFwLDE3RKoNNWBMBc1
	DrwvzpmxPNcXh2G187H0WSwr3oKlpbHtorRqk=
MIME-Version: 1.0
Received: by 10.227.38.162 with SMTP id b34mr1010807wbe.129.1279291911336; 
	Fri, 16 Jul 2010 07:51:51 -0700 (PDT)
Received: by 10.216.156.133 with HTTP; Fri, 16 Jul 2010 07:51:51 -0700 (PDT)
Date: Fri, 16 Jul 2010 10:51:51 -0400
Message-ID: <AANLkTikZkRU-dCiBNlVdZ6XYsdBk3MjZBksexc6JtSAT@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: george.huntingtoniii@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: busybox mdev
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
X-List-Received-Date: Fri, 16 Jul 2010 14:51:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

how do i make a distribution use mdev instead of udev?

