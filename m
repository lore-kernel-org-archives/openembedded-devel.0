Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LJlmk-0004NG-Tu
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2009 10:30:11 +0100
Received: from [172.16.23.192] (helo=buddha.tw.openmoko.com ident=Debian-exim)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.org>)
	id 1LJlgq-0002Jc-T8 for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2009 17:24:14 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LJlhz-0006Br-LB
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2009 17:25:15 +0800
Date: Mon, 5 Jan 2009 17:25:15 +0800
From: John Lee <john_lee@openmoko.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20090105092515.GG29421@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 172.16.23.192
X-SA-Exim-Mail-From: john_lee@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Please review john_lee/fastboot-devel
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
X-List-Received-Date: Mon, 05 Jan 2009 09:30:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

First of all please pardon the inappropriate name 'fastboot-devel'
since I have been using this branch to coordinate with others and I
don't want to create another branch in git that I cannot delete later.

Thanks for Koen, who alredy sent me a lot of feedbacks and we modified
according to his suggestion.  Most of the fastboot stuffs are general
now.  Please review it.  If it's okay, I'll commit it this Friday.


- John


