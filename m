Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LXz0S-0000Ox-4N
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 15:27:04 +0100
Received: (qmail 16138 invoked by uid 813007); 13 Feb 2009 14:25:38 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Feb 2009 14:25:38 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@openembedded.org
Date: Fri, 13 Feb 2009 15:25:33 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc2; KDE/4.2.0; x86_64; ; )
MIME-Version: 1.0
Message-Id: <200902131525.34787.openembedded@haerwu.biz>
Subject: Machine config generator (FOSDEM idea)
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
X-List-Received-Date: Fri, 13 Feb 2009 14:27:04 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi

I was talking during FOSDEM with some developers and one of things which 
I was asked about was 'how to create machine config' (usually question 
was other but had this sense).

OE developers usually know that machine config is simple but tell that 
to Joe Random who only knows that his board use s3c2443 etc. So idea was 
to create simple few steps wizard which will ask few questions and 
produce machine config as result. More work would be required on 
creating kernel recipe because kernel can be from svn/cvs/git or tarball 
+ quilt patchset etc...

Thats only beginning of idea - I hope that someone will provide 
feedback.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




