Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <slapinid@gmail.com>) id 1HbaDN-0005ZD-E9
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2007 12:38:13 +0200
Received: by ug-out-1314.google.com with SMTP id e2so78076ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2007 03:38:13 -0700 (PDT)
Received: by 10.67.90.1 with SMTP id s1mr356411ugl.1176287893092;
	Wed, 11 Apr 2007 03:38:13 -0700 (PDT)
Received: from ?85.249.166.143? ( [85.249.166.143])
	by mx.google.com with ESMTP id z40sm15402590ikz.2007.04.11.03.38.01;
	Wed, 11 Apr 2007 03:38:12 -0700 (PDT)
Message-ID: <461CBA64.4070508@gmail.com>
Date: Wed, 11 Apr 2007 14:37:24 +0400
From: Sergey Lapin <slapinid@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: scratchbox toolchain + QA errors
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
X-List-Received-Date: Wed, 11 Apr 2007 10:38:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi, all!
Is there some way to convert OE-built toolchain to scratchbox one?
I'd like to use it to play with task-sdk-sbox output.
Any guidelines?

And also - is there some standard tecniques to fix errors with .la files
except for deleting them? I understand sed way, but probably something
more sane exists? (SDK is needed to be postprocessed to fix .la files)

Thanks a lot,
S.


