Received: from [61.129.64.66] (helo=mail.og-int.com)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <yangtf@envision.com.cn>) id 1IQZbR-0000Z9-4o
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2007 04:17:49 +0200
Received: from [218.80.208.102]; Thu, 30 Aug 2007 10:15:44 +0800
From: "Tongfeng.Yang" <yangtf@envision.com.cn>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2007 10:17:40 +0800
Message-Id: <1188440260.32489.12.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.3 (2.8.3-2.fc6) 
Subject: Problem: how to use kernel and cross-compiler that already exist
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
X-List-Received-Date: Thu, 30 Aug 2007 02:17:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello EveryOne:
       I have a kernel and cross-compiler for a special device . and I
want to run openmoko on that device .
so the best way is use the exist tool to compile it ! I notice that OE
auto fetch and compile cross tool .but think this :
       My target device use glibc2.3.3 gcc 3.3.4 .so i change .conf file
to this . But It can't pass . Lots of error occur when do_configure and
do_build . so use exist tool is the only way i can go !
        
        how ?

Best wishes

Tongfeng.Yang 




