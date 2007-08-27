Received: from [61.129.64.66] (helo=mail.og-int.com)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <yangtf@envision.com.cn>) id 1IPaFX-0008To-W5
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Aug 2007 10:47:08 +0200
Received: from [211.144.100.19]; Mon, 27 Aug 2007 16:45:23 +0800
From: =?UTF-8?Q?=E6=9D=A8=E5=90=8C=E5=B3=B0?= <yangtf@envision.com.cn>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2007 16:47:15 +0800
Message-Id: <1188204435.2137.46.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.3 (2.8.3-2.fc6) 
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Why Not Remove Src after Install
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
X-List-Received-Date: Mon, 27 Aug 2007 08:47:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello EveryOne : 
           when I use OE to build OpenMoko , I found my disk has not
enough space .and the project has cost 13 G . 
   we know that when finish of do_fetch ,the source will unpack to tmp
dir .  My question is why not remove the dir 
   which uppack create to save usr's disk space ? 

          Another question is that where the file install to  ,and how
can i set it ? 
           If i want to remove source files after install ,how can i do
it ?

           Thank you ! 

Tongfeng.Yang 
2007-8-27
     
  

