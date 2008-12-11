Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LAZZ0-0000RE-SE
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 01:37:59 +0100
Received: from p5b0369ce.dip.t-dialin.net ([91.3.105.206] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LAZV4-0005sb-3e by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2008 01:33:56 +0100
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1LAZUx-0001kT-RJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 01:33:47 +0100
Date: Thu, 11 Dec 2008 01:33:47 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081211003347.GC16050@excalibur.local>
References: <20081210234910.GA16050@excalibur.local> <49405BD7.2010801@gmx.de>
MIME-Version: 1.0
In-Reply-To: <49405BD7.2010801@gmx.de>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: [RFC] Ship dbus config and dbus service activation files
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
X-List-Received-Date: Thu, 11 Dec 2008 00:37:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2008-12-11 at 01:16, Thomas Kunze wrote:
> Stefan Schmidt schrieb:

>> The following patch i nstalls the files correctly for me. Never used FILES_${PN}
>> before so I would like to get some review before.
>>   
> Maybe its better to create a package wpasupplicant-dbus. IMO we should  
> try to split packages if we can and  the dbus
> functionallity is clearly separable from wpasupplicant core functions.

I wouldn't mind. Where would you like to draw the line for such a split? Just
the dbus specific files or a wpa-supplicant version without and one with dbus
enabled?

If it is only about these two file it may not be worth the effort. I'm open
about this though.

regards
Stefan Schmidt


