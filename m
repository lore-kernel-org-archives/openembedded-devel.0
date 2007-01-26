Received: from [202.165.105.139] (helo=web15209.mail.cnb.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <wzc0066@yahoo.com.cn>) id 1HAHcO-0001JA-8t
	for openembedded-devel@openembedded.org; Fri, 26 Jan 2007 04:19:17 +0100
Received: (qmail 26621 invoked by uid 60001); 26 Jan 2007 03:18:55 -0000
X-YMail-OSG: a8.hkkwVM1lH64TNyxZPW8G17D7VtvqqYBqFoo9y.dltC6rka2HtOTdWgAGVRSeLNYakbKiOtE1JSJNNDUF7cBmKp6OdtzgI9lmXqG5cMD3XPMpABM.G
Received: from [221.221.147.7] by web15209.mail.cnb.yahoo.com via HTTP;
	Fri, 26 Jan 2007 11:18:55 CST
Date: Fri, 26 Jan 2007 11:18:55 +0800 (CST)
From: zechao wang <wzc0066@yahoo.com.cn>
To: oe list <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Message-ID: <783589.26485.qm@web15209.mail.cnb.yahoo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: call for help ?
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
X-List-Received-Date: Fri, 26 Jan 2007 03:19:17 -0000
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit


Hello everyone !

I have built the libgnome (bb file) successfully, but i had to use the
command: bitbake -b libgnome_version.bb

If i use the command: bitbake libgnome, it says: " ERROR: No buildable
providers available for required build target libgnome ". But the other 
bb file (packages) could be built nornally in this way.

I don't know why ?
who can tell me ? Thanks¡­¡­





 		
---------------------------------
ÇÀ×¢ÑÅ»¢Ãâ·ÑÓÊÏä-3.5GÈÝÁ¿£¬20M¸½¼þ£¡ 
From jeremy.laine@m4x.org Fri Jan 26 09:16:38 2007
Received: from [80.68.90.16] (helo=cartier.jerryweb.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <jeremy.laine@m4x.org>) id 1HAMGE-0002Fe-Hg
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jan 2007 09:16:38 +0100
Received: by cartier.jerryweb.org (Postfix, from userid 33)
	id A2D37C142; Fri, 26 Jan 2007 07:04:33 +0000 (GMT)
Received: from wwwgate162.motorola.com (wwwgate162.motorola.com
	[82.195.186.223]) by webmail.jerryweb.org (Horde MIME library) with
	HTTP; Fri, 26 Jan 2007 09:16:37 +0100
Message-ID: <20070126091637.dsyf5wsolc0w4kcs@webmail.jerryweb.org>
Date: Fri, 26 Jan 2007 09:16:37 +0100
From: Jeremy =?iso-8859-1?b?TGFpbuk=?= <jeremy.laine@m4x.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
User-Agent: Internet Messaging Program (IMP) H3 (4.1.3)
Subject: [oe] [website] Problem with filebrowser and "+" sign
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
X-List-Received-Date: Fri, 26 Jan 2007 08:16:38 -0000

Hello,

It looks as though there is a problem with the web interface to the
MTN repository, I am unable to browse the following directory:

http://www.openembedded.org/filebrowser/org.openembedded.dev/packages/gtk+

Cheers,
Jeremy

-- 
http://www.jerryweb.org/             : JerryWeb.org
http://sailcut.sourceforge.net/      : Sailcut CAD
http://opensource.polytechnique.org/ : Polytechnique.org Free Software




