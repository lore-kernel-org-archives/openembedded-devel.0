Received: from mail-gw0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PPh4O-0004mX-TY
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Dec 2010 20:49:57 +0100
Received: by gwj22 with SMTP id 22so4596815gwj.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Dec 2010 11:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=IawqZZdwZSDBBs3YgQS7Y909u0l5N9KYBNjQv6EJN3E=;
	b=MasXeJ85e96ExqpjRMVI3vJZHaGQelec0KhAJgrDT6eWSrXgI99hqXibEHbhgNlLb2
	4EnRdWnJ9rw3SffW65hJxNhCG1JPWztVn2HTD7bbULwxj/HBoQGsRN29Qc3UU7JIKz/K
	jNbSwzPdeNgweSUwEGFsWwlWz3l4GVjSuDtyA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=SpxMnoSwTgaPiTs83cdjvWqiKYsmCz7XQ/jwV8hbEBK2P1TjGBjPT/dW0ot6VM1xa1
	rUpUwKSxgglHo4b7EPTXdULYMi9ufoO0ktRYmqb1iCCHku1lWWYjqDXoXkyHqzpgF7ip
	Lfrgiip+fVX9+tXncrE0oGPNMHRjzA4omZVX4=
MIME-Version: 1.0
Received: by 10.231.20.65 with SMTP id e1mr6412704ibb.32.1291664908427; Mon,
	06 Dec 2010 11:48:28 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Mon, 6 Dec 2010 11:48:28 -0800 (PST)
Date: Mon, 6 Dec 2010 20:48:28 +0100
Message-ID: <AANLkTi==kWiyOrmeUeUVNeC8FT0B8XxruHA0X4qMaPs_@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, poky@yoctoproject.org
X-SA-Exim-Connect-IP: 74.125.83.41
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libcdaudio license issue
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
X-List-Received-Date: Mon, 06 Dec 2010 19:49:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was checking libcdaudio for LICENSE info.
recipe says GPL
COPYING file is the GPLv2 one
README file says:

libcdaudio is distributed under the GNU Library General Public
License, included in this package under the top level source directory
in the file COPYING

C files also mention LGPL. but say v2 or later

What to do with this in the LICENSE field? LGPLv2+ ?

Frans


