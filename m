Received: from [64.233.184.231] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dfarning@gmail.com>) id 1KVVSP-0005pP-V9
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Aug 2008 19:57:26 +0200
Received: by wr-out-0506.google.com with SMTP id c53so67633wra.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2008 10:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:reply-to:to
	:in-reply-to:references:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding:sender;
	bh=Hg0MvZCiujllIwfTC9osksGOGf3WHFg+Dd8gQOAlUl8=;
	b=YYJ9T/ZPdbclWNEnqd5olt5pq7EufExO31EB23jHDuCDr+8ICHE/vIYrorxDyAQDRD
	brBweGhR04eKzHGmK9kVancQislvFiiYNvjya45e4cZQrfFl4/L7IT7y0S+HX2o//AtK
	37oxvJyjnkcTf+xOMqqpJ7qFyZLk5p6stYomM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:in-reply-to:references:content-type:date
	:message-id:mime-version:x-mailer:content-transfer-encoding:sender;
	b=s5m527FtMXwNtfPg+oFtHEsvWR7HroN314LqEYoM2732U9lCOFES+SEPUOukbXcR0Y
	Glm9PquepwY0jTA5oUTBqoEkjf3RBa4fRvGPGFjeXV+LKW65oZ4F0rhs+QH2ACOyUSUw
	LcH79WH3jOdHpU+iGHQXYobsja8qviZeoNxNk=
Received: by 10.90.104.20 with SMTP id b20mr9969441agc.63.1219168583474;
	Tue, 19 Aug 2008 10:56:23 -0700 (PDT)
Received: from ?192.168.2.3? ( [75.121.143.78])
	by mx.google.com with ESMTPS id 36sm417275aga.10.2008.08.19.10.56.21
	(version=SSLv3 cipher=RC4-MD5); Tue, 19 Aug 2008 10:56:22 -0700 (PDT)
From: David Farning <dfarning@sugarlabs.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080819111339.GA19947@datenfreihafen.org>
References: <1219122247.7224.337.camel@dfarning.desktop.org>
	<20080819111339.GA19947@datenfreihafen.org>
Date: Tue, 19 Aug 2008 12:56:20 -0500
Message-Id: <1219168580.7224.447.camel@dfarning.desktop.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Sender: David Farning <dfarning@gmail.com>
Subject: Re: Sugar Desktop
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
X-List-Received-Date: Tue, 19 Aug 2008 17:57:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-08-19 at 13:13 +0200, Stefan Schmidt wrote:
> Hello.
> 
> On Tue, 2008-08-19 at 00:04, David Farning wrote:
> > I am wondering if there is interest in creating OE packages for the
> > Sugar desktop [1].
> 
> There is interest. I got a XO laptop from the OLPC Germany at the linuxtag. The
> two goals are XO machine support in OE and packages for all kind of sugar
> applications. So far I worked on machine support in my small spare time. Machine
> is added, kernel compiles and boots fine, something is still worng when booting
> the rootfs. Once this is fixed I'll send the patches for review.

As of last week,  OLPC has started working directly with Fedora to make
a native Fedora desktop run on the XO.  I hope this leads to more
upstream interest porting more platforms to the XO.  Currently, OLPC is
working pretty hard to get 8.2 released.  Please remind me in a couple
of weeks (in case I forget) to set up some hardware contacts for you.

> > Please let me know if anyone is interested in this type of project.  If
> > so, I will try to get something started.
> 
> Getting help on the sugar front wuld be great. So I you have someone who would
> like to help out here let us know.
> 

We are working with Jason Kridner from TI about doing a port to the
beagleboard using the OE toolkit.  We are setting up a colobration
infrastructure at http://elinux.org/BeagleBoardSugar .  From an upstream
perspective, is this list and the OE wiki the best places to have
OE/Sugar discussions.

thanks
dfarning



