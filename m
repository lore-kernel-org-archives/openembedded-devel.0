Received: from qmta03.emeryville.ca.mail.comcast.net ([76.96.30.32])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1PSYoq-0006w6-3k
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 18:37:44 +0100
Received: from omta03.emeryville.ca.mail.comcast.net ([76.96.30.27])
	by qmta03.emeryville.ca.mail.comcast.net with comcast
	id j2qS1f0030b6N64A35c8Uo; Tue, 14 Dec 2010 17:36:08 +0000
Received: from [192.168.1.101] ([71.202.66.210])
	by omta03.emeryville.ca.mail.comcast.net with comcast
	id j5c51f00U4YBSof8P5c6wa; Tue, 14 Dec 2010 17:36:07 +0000
Message-ID: <4D07AB03.6030408@comcast.net>
Date: Tue, 14 Dec 2010 09:36:03 -0800
From: Ed Nelson <enelson1000@comcast.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 76.96.30.32
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: i2c-tools_3.0.2.bb recipe question
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
X-List-Received-Date: Tue, 14 Dec 2010 17:37:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Sorry if this is a lame question.
In the do_install_append() section
install -d ${D}{$includedir}/linux

Is there a difference between
${includedir}
and
{$includedir}


Thanks
Ed


