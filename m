Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PlLPy-0008Fp-I8
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 14:09:47 +0100
Received: by pzk12 with SMTP id 12so395757pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 05:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=QBGklAVVkdAAB4Tl08iSqAP2+e5yPk768bjv7VBmrVI=;
	b=RSVtLboFxy66EnqiadFvQlSv8IJa7b/9VRGHvR6CWX3V3ezWKBRHREpOZGkrFUIdkg
	aKnX2DYQMuoYsvldqcw4obSr12PVfJdwM3iLIDzRgPf9Qs755eJf8H9DrzLFQ2lmqzwh
	Z7YCeEYOXQv4gCAs7NugPvEZ9Qz4e3Ypjh5x0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=S2pqP01kWOsIZSWjRREVRBpx7y3ReKWKGWF+rBEh4s69nFmmg3MyD2EYRQkeqcFGeK
	3Db3/VQFd4OUp7LBu+xrEwqA20cQY1zb9yGouKu3PcyZkV1yQHmB664XneM4fqRMJClU
	FQjf6huUk5qojqVa8uxCC++Q+432HYdEUQ+A4=
MIME-Version: 1.0
Received: by 10.142.238.19 with SMTP id l19mr11673239wfh.316.1296824917991;
	Fri, 04 Feb 2011 05:08:37 -0800 (PST)
Received: by 10.142.155.8 with HTTP; Fri, 4 Feb 2011 05:08:37 -0800 (PST)
Date: Fri, 4 Feb 2011 08:08:37 -0500
Message-ID: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: testing branch 2011-02-03
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
X-List-Received-Date: Fri, 04 Feb 2011 13:09:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

master has been merged to testing-next and is ready for clean builds.

I realize I've been tardy in getting the testing-next going, so I'm
going to create a cron job now that does that weekly.

Last week's testing results:

http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2011-01-28

For more information on OE testing, see:

http://www.openembedded.org/index.php/Testing

Thanks,
Cliff

-- 
=================
http://bec-systems.com


