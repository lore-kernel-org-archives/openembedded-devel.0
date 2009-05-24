Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M8LiW-0003tt-Sq
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 23:58:53 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1556981ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 14:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=/7KX5bpn2iOtpY7p7bRHWxhSS3xlaOGGvFwcrquO/6k=;
	b=nWe7CTYoPiiaHdgPpQFCZa7J4z4HXVpy8wqi/lYXxGYDNAN7KJIRwUSc5vxtNg3g2H
	nJJ1B71EpAC31wIjeQdy/UidXgOs+FNEg1z9PYjGUmx2P2npnraGB4AJ45HPtscvC8vM
	ts/8jNJ4VPASz/0vavbH/bJN8N+gH2YzZ5Fdk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=eENfF59qJMYRH/VAZXX6GBv70qr/QT/CBqv1SXKWhBFix4l5zGNXzC00v27n+AZNSd
	8BgcCnN4jCp/uxv/Ar64ofMIMtIYpZcQLfIoUT1VAmd+wBeP7lajjIybf6nhRPqkqo8D
	30b86N5cnTW9k/LAmTmxGNEHvTzH9gYCk8Dqc=
MIME-Version: 1.0
Received: by 10.90.55.3 with SMTP id d3mr5624461aga.100.1243201856706; Sun, 24 
	May 2009 14:50:56 -0700 (PDT)
Date: Sun, 24 May 2009 23:50:56 +0200
Message-ID: <c384c5ea0905241450p281a0606re27efd076627fcf2@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [RFC] Post a heads-up [HEADS UP] mail when an intrusive patch has landed in dev or stable
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
X-List-Received-Date: Sun, 24 May 2009 21:58:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

RFC:

we have had some proposed intrusive patches land in the metadata with
only a few people aware of the fact they landed at all (or why).

Proposal is to post a "[HEADS UP] Description of changed behaviour"
email on the -devel mailing list when you pushed an intrusive patch.

Do this in a new thread (not replying to an old thread).


The current situation is that the intrusive push go-ahead is often at
the tail of a thread, and not every dev can track all RFC's.

It helps people jump in on the change early.

Regards,
-- 
Leon


