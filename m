Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <axel.lin@gmail.com>) id 1Ga4qk-0004Q8-Pp
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Oct 2006 08:24:22 +0200
Received: by py-out-1112.google.com with SMTP id i75so217497pye
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2006 23:17:23 -0700 (PDT)
Received: by 10.35.98.6 with SMTP id a6mr17031390pym;
	Tue, 17 Oct 2006 23:17:23 -0700 (PDT)
Received: by 10.35.15.3 with HTTP; Tue, 17 Oct 2006 23:17:23 -0700 (PDT)
Message-ID: <427d64720610172317t1e89518bx16ffbdae70fdbfb4@mail.gmail.com>
Date: Wed, 18 Oct 2006 14:17:23 +0800
From: "axel lin" <axel.lin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Fail to start dropbear
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 06:24:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi list,
I got below messages when start dropbear... ( config is angstrom/mainstone)
how to fix this?

root@mainstone:/$ /etc/init.d/dropbear start
Starting Dropbear SSH server: Will output 1024 bit rsa secret key to
'/etc/dropbear/dropbear_rsa_host_key'
Generating key, this may take a while...
Exited: couldn't open random device

Thanks for your help.
Axel


