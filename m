Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JZ5qA-0007u6-Cl
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 15:52:43 +0100
X-ASG-Debug-ID: 1205247030-34cf00010000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 2856115971
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 09:50:31 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id M02B7PoQoktEZjFp for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 09:50:31 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] [Announce] OpenEmbedded stable branch
Date: Tue, 11 Mar 2008 09:50:28 -0500
User-Agent: KMail/1.9.7
References: <fr5mkp$h1b$1@ger.gmane.org>
In-Reply-To: <fr5mkp$h1b$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200803110950.29059.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1205247031
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Announce] OpenEmbedded stable branch
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
X-List-Received-Date: Tue, 11 Mar 2008 14:52:56 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 11 March 2008 05:24:24 am Koen Kooi wrote:

> It seems a lot of people are unaware that there is a stable branch where
> only review patches get applied:
>
> org.openembedded.angstrom-2007.12-stable
>
> So I don't want to hear anymore of those "OE is unstable" or "There is
> no stable branch" complaints anymore, mmmmkay ;)

It might be a good idea to package up a tarball of the stable version, if only 
because it gives potential users warm fuzzies.  I have the same basic 
complaint about buildroot.  There's no "version" to download.  The difference 
is I've never had a buildroot daily snapshot just work for me.  I have had 
openembedded.dev checkouts just work :)  

Also, having to mess with monotone just to scope out the project could turn 
some potential users off.

2 cents from an outsider...

---
Geoffrey



