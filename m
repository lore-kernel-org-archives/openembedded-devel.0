Received: from smtp7.myhsphere.biz ([204.10.105.69] helo=mail9.myhsphere.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <balakrishnan@e-consystems.com>) id 1OKOqf-0003Nh-U8
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 06:49:39 +0200
Received: (qmail 7943 invoked by uid 399); 4 Jun 2010 04:45:16 -0000
Received: from dsl-tn-dynamic-104.231.164.122.airtelbroadband.in (HELO
	?192.168.6.196?) (balakrishnan@e-consystems.com@122.164.231.104)
	by mail9.myhsphere.biz with ESMTPAM; 4 Jun 2010 04:45:16 -0000
X-Originating-IP: 122.164.231.104
X-Sender: balakrishnan@e-consystems.com
From: balakrishnan <balakrishnan@e-consystems.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <mailman.11263.1275577117.24517.openembedded-devel@lists.openembedded.org>
References: <mailman.11263.1275577117.24517.openembedded-devel@lists.openembedded.org>
Date: Fri, 04 Jun 2010 10:15:16 +0530
Message-Id: <1275626716.3916.53.camel@balakrishnan-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 204.10.105.69
X-SA-Exim-Mail-From: balakrishnan@e-consystems.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux_2.6.34 staging error
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
X-List-Received-Date: Fri, 04 Jun 2010 04:49:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I have used below mentioned linux.inc file, but same staging error came.
The log file also empty, so I can't able to find out whats the error.
How can I resolve this?.

NOTE: Running task 391 of 546 (ID:
14, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_package)
sh: arm-angstrom-linux-gnueabi-depmod-: command not found
NOTE: the following files were installed but not shipped in any package:
NOTE:   /lib/modules/2.6.34/modules.order
NOTE:   /lib/modules/2.6.34/modules.builtin
NOTE: Running task 396 of 546 (ID:
9, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_populate_staging)
ERROR: function do_stage failed
ERROR: see log
in /home/balakrishnan/econsystems/projects/tmp/work/alioth-angstrom-linux-gnueabi/linux-2.6.34-r1/temp/log.do_stage.30045

With Thanks
J.Balakrishnan


> Message: 1
> Date: Thu, 3 Jun 2010 12:13:46 +0200
> From: Andrea Adami <andrea.adami@gmail.com>
> Subject: Re: [oe] linux_2.6.34 staging error
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
>         <AANLkTikusbhJ1B3Khq4FeGbyrllm3VLpeLPHgvSuLiVU@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
> 
> I fear stable/2009 lacks some magic in linux.inc.
> 
> Worst, staging has been revolutioned...
> Here is the actual:
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux.inc
> 
> Regards
> 
> Andrea



