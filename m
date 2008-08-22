Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dfarning@gmail.com>) id 1KWKY4-0006xB-Bf
	for openembedded-devel@openembedded.org; Fri, 22 Aug 2008 02:30:40 +0200
Received: by py-out-1112.google.com with SMTP id a73so285966pye.2
	for <openembedded-devel@openembedded.org>;
	Thu, 21 Aug 2008 17:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:reply-to:to:cc
	:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding:sender;
	bh=X6hbb8uTnoxPTpQl28dQqgkPP55hYZmSl9tlGpBDBaw=;
	b=Hat0/oopHrXxjgTi5IYJy2zqtvO/AMWxleKpDuUmR3BmoHwmYCxuUFuB4208nNKgTB
	3ziFekA8p55FiypLKPAQxX060YJ6tcqZwZ8CXKw074ynEI/YWLcY+JVoOsJrhaO7xXel
	5sytd8orsa9MFOYcxm05GYWptu/8zT+cWMJv8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:cc:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding:sender;
	b=DHjSmn5NN8cUr3NdwAdXwNVSScPJ4vrQ1yaG10UZHieBLzOzY00cgdf75TefWH4hEa
	YMvX9n8g8HcYhUvzUcsdn1Dm9MhnFOwW/1OuX2FpqK9Z7go4T57ni3j9b1ER9SWXUejy
	wv7qsGC3/a6dn7RN4B8lectapSLUeUS1EFMqk=
Received: by 10.65.158.19 with SMTP id k19mr805963qbo.94.1219364967920;
	Thu, 21 Aug 2008 17:29:27 -0700 (PDT)
Received: from ?192.168.2.3? ( [75.121.174.99])
	by mx.google.com with ESMTPS id s27sm1063298qbs.12.2008.08.21.17.29.26
	(version=SSLv3 cipher=RC4-MD5); Thu, 21 Aug 2008 17:29:27 -0700 (PDT)
From: David Farning <dfarning@sugarlabs.org>
To: beagleboard <beagleboard@googlegroups.com>
Date: Thu, 21 Aug 2008 19:29:24 -0500
Message-Id: <1219364965.7212.319.camel@dfarning.desktop.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Sender: David Farning <dfarning@gmail.com>
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	Sugar List <sugar@laptop.org>
Subject: Sugar on the BeagleBoard using the OpenEmbedded toolkit.
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
X-List-Received-Date: Fri, 22 Aug 2008 00:30:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Welcome to the Sugar on the BeagleBoard project.  It seems that we have
all of the pieces in place to do a port.

First, some background.

The initial port will be getting Sugar[1] to run on the Beagleboard[2]
using the Open Embedded[3] toolkit.

For a collaboration point, Jason has set up the sugar on beagle wiki[4].

For Sugar related bug, Sugar Labs uses the OLPC trac[5]. Open Embedded
uses bugzilla[6].

If you are interested come introduce yourself on the beagleboard[7]
mailing list.

thanks
dfarning


1. http://sugarlabs.org/go/Main_Page
2. http://beagleboard.org/
3. http://wiki.openembedded.net/index.php/Main_Page

4. http://elinux.org/BeagleBoardSugar

5. http://dev.laptop.org/wiki
6. http://bugs.openembedded.net/

7. http://groups.google.com/group/beagleboard?hl=en






