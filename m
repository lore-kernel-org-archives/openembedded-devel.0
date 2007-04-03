Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HYfpJ-0002Kq-Ci
	for openembedded-devel@openembedded.org; Tue, 03 Apr 2007 12:01:23 +0200
Received: (qmail 8109 invoked by uid 813007); 3 Apr 2007 10:00:59 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 3 Apr 2007 10:00:59 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 3 Apr 2007 12:01:04 +0200
User-Agent: KMail/1.9.6
References: <4611582F.8010203@openhardware.net>
In-Reply-To: <4611582F.8010203@openhardware.net>
MIME-Version: 1.0
Message-Id: <200704031201.05082.openembedded@hrw.one.pl>
Subject: Re: versioning madness
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
X-List-Received-Date: Tue, 03 Apr 2007 10:01:26 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


I think that you should ignore fact that your machine is not wide used and 
submit your changes into OE. For example I do not know does anyone other 
then me use ProGear support in OE but this does not stopped me from 
adding it.

You can also create own branch in monotone database where you will 
cherrypick needed changes from .dev tree (or even use .dev tree locally 
with your changes commited into database).

Other way is bb collections where you set which tree is more important 
then others. But here I can't tell how it handle misc PR in both trees.

You can also use PR ="s88" in your tree as "s" > "r" and use same numbers 
as OE ones to get info how synced you are.

There are many methods - I would choose first one.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

               Don't personalize computers. They hate that.




