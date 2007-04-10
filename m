Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <slapinid@gmail.com>) id 1HbHcW-00074Y-Nn
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 16:47:00 +0200
Received: by ug-out-1314.google.com with SMTP id s2so75580uge
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 07:46:56 -0700 (PDT)
Received: by 10.82.108.9 with SMTP id g9mr9515712buc.1176216416168;
	Tue, 10 Apr 2007 07:46:56 -0700 (PDT)
Received: from ?192.168.6.144? ( [62.152.84.97])
	by mx.google.com with ESMTP id y34sm13863412iky.2007.04.10.07.46.54;
	Tue, 10 Apr 2007 07:46:54 -0700 (PDT)
Message-ID: <461BA347.5060908@gmail.com>
Date: Tue, 10 Apr 2007 18:46:31 +0400
From: Sergey Lapin <slapinid@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <evcm2e$15q$1@sea.gmane.org>	<1176155636.5842.25.camel@localhost.localdomain>	<432beae0704091515n6a55a294jfdf64c9e855b9537@mail.gmail.com>	<3ef3a7ad0704100602v610f6c10k447a1551f79ca750@mail.gmail.com>
	<1176215946.5809.90.camel@localhost.localdomain>
In-Reply-To: <1176215946.5809.90.camel@localhost.localdomain>
Cc: openembedded-devel@openembedded.org
Subject: Re: OE a deterministic build system?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2007 14:47:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi, all!


Richard Purdie wrote:
> On Tue, 2007-04-10 at 14:02 +0100, José Bernardo Bandos Rodrigues wrote:
>> Are you by any chance using ubuntu? If so, do a "sudo dpkg-reconfigure dash"
>> and stop it replacing /bin/sh.
>> That was the reason for most of the problems I had with oe, including a
>> couple of "undefined reference to main".
> 
> Can someone make sanity.bbclass detect dash and exit with a
> warning/error? :)

Probably better is to make bash-native and depend on it?
(or ash)
Just curious.

S.


