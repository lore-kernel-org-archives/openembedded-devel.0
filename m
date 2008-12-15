Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ticktock35@gmail.com>) id 1LCEAC-0007ab-Ha
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Dec 2008 15:11:12 +0100
Received: by rv-out-0708.google.com with SMTP id f25so3000831rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2008 06:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type;
	bh=qgurDYtTn2xyKgIGcUI70JujWq+3uE1Tlt4AOPpqrLk=;
	b=MKha986ZgU8VL/DfN6uEU03Hk9XDpMbpPdFS+5lZHL1eXNUZFOcqOoEHLnbLov3upy
	ymlPNmRd3ZOSZ6nNoLxzBww7q6Vu1VHHvfnN2MuUwY/PS+dNv4iwSd3fue/Q0AMlqa5a
	zqwOOrw6IGgkxWAyi08NhWywkiWnEgfIxI+58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type;
	b=PPMJpw3Zh26VLxf0rbtULy5eQWLz56F/4qFZJccRjC2sSPz5w/NSv9HM+7VkXRENaw
	685dfdzrlcxT3JAPn8IeYhpixftHrqSE7dUC8v8i7wmG5e7FoN3WIl1UtXTwr33KUBqa
	Bv+OHc00d1gzz5cq4S/4sbxqXcNxSeZdaU7ps=
Received: by 10.140.187.10 with SMTP id k10mr3721273rvf.264.1229350009411;
	Mon, 15 Dec 2008 06:06:49 -0800 (PST)
Received: by 10.140.193.20 with HTTP; Mon, 15 Dec 2008 06:06:49 -0800 (PST)
Message-ID: <565965130812150606k7a71c258xd15232d9edf88cfe@mail.gmail.com>
Date: Mon, 15 Dec 2008 22:06:49 +0800
From: "I-Fan, Chen" <ticktock35@gmail.com>
To: openembedded-devel@lists.openembedded.org, opkg-devel@lists.openmoko.org, 
	opkg-devel@googlegroups.com
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: I will move Opkg development from OM svn to Google code
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
X-List-Received-Date: Mon, 15 Dec 2008 14:11:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi lists,
   After a long thinking and taking advice from some OE people.
In order to keep improving opkg,
I decided to move opkg upstream from OM svn to Google code,
and keep developing opkg on the new site.

Project:
http://code.google.com/p/opkg/

Group:
http://groups.google.com/group/opkg-devel
mailto: opkg-devel@googlegroups.com <opkg-devel@googlegroups.com>

Checkout Code:
http://code.google.com/p/opkg/source/checkout

Because of I am still working on the code of upgrade and install, and trying
to provide better data structure and algorithm.
I recommend a older version r172 for people want a proven stable opkg now.

It's a pity that the committer  and commit timestamps were missed when
moving from OM svn to Google code.
Most of the great job are made by Thomas Wood, thank you.

Any help are welcomed.
P.S. I cannot get e-mail from my openmoko.org account for now; therefore, if
anyone had mailed me,
I am sorry, I cannot get those mails now.

Cheers,
Tick

