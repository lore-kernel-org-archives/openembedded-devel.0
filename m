Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P0JWL-00061i-QU
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 21:37:54 +0200
Received: by wyb35 with SMTP id 35so2282318wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 12:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=iRopjKcYFEvDeU0rMo9XPCTOi783g2HCPm7EtNCHTkI=;
	b=bkaaEcuJLzQnX6K2u3+h0dty/H7xijzeSLgp4R/5Z0mpMeovnOgLwqpUUSk0MPEtf6
	LHTXtUxgntMMUNUygBsDnmhuL6R+tFZt/9w0bVgjgV8ZFeU+NzULTeg4mK4Ebymbb+Rn
	CO1+QKCUzAWrZYEFAzQgDo+Emc+R1yD8rOqmU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=MBp51TICwNEM7v0htJvS866BxC9Qs8+XWZfqJ28r6KBGAiBbQHJKhvEjqE7yotXvMC
	tCvJUQPynkDgz15JNen1oxVZMmqWO/1y/FOGLMQwgthUXEe8SV+pg4gJZF5lpFrAtVhC
	NQfZ84/dEr5tRwsVMscdlm5g+BN+PV7gG+2Yk=
MIME-Version: 1.0
Received: by 10.216.67.6 with SMTP id i6mr52384wed.44.1285616253941; Mon, 27
	Sep 2010 12:37:33 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Mon, 27 Sep 2010 12:37:33 -0700 (PDT)
Date: Mon, 27 Sep 2010 15:37:33 -0400
Message-ID: <AANLkTimErDzoKvh=YVsmAptdjojPXFHS7Xd1Sfq88To0@mail.gmail.com>
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
Subject: testing branch 2010-09-27
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
X-List-Received-Date: Mon, 27 Sep 2010 19:37:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

We had a successful test run last week:

http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=testing_2010-09-20

master has been merged to testing-next and is ready for clean builds.

http://wiki.openembedded.net/index.php/Testing

Thanks,
Cliff

-- 
=================
http://bec-systems.com


