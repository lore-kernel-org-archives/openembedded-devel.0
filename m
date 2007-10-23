Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1IkC0d-0006fq-Cv
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2007 07:08:55 +0200
Received: by py-out-1112.google.com with SMTP id a25so3374199pyi
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2007 22:01:46 -0700 (PDT)
Received: by 10.65.103.14 with SMTP id f14mr11330244qbm.1193115705806;
	Mon, 22 Oct 2007 22:01:45 -0700 (PDT)
Received: from lenovo ( [75.121.171.134])
	by mx.google.com with ESMTPS id 15sm1983237nzp.2007.10.22.22.01.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2007 22:01:45 -0700 (PDT)
Received: by lenovo (sSMTP sendmail emulation); Tue, 23 Oct 2007 00:01:42 -0500
Date: Tue, 23 Oct 2007 00:01:42 -0500
From: David Farning <dfarning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071023050142.GA10583@lenovo>
References: <20071022033811.GA8050@lenovo>
	<471C4DD9.5090707@student.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <471C4DD9.5090707@student.utwente.nl>
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: Re: getting started - docbook
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
X-List-Received-Date: Tue, 23 Oct 2007 05:08:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 22, 2007 at 09:14:33AM +0200, Koen Kooi wrote:
> > Would you it be useful if I cleaned up the wiki and converted it to
> > docbook for inclusion in the manual? 
> 
> Yes! yes! YES!!!!

Ok, I'll start putting a drop in replacement for the existing getting
started chapter based on my _limited_ experience, the gettingstarted
wiki, and questions frequent questions in the users ML.

Time permitting, I will submit a draft on Monday.  Bob, thanks for the
offer to proof read and test.

I am thinking about going through 4 basic steps
1. install
2. configure
3. build
4. test

I would like to use a concrete example that a user can build and
test on qemu.  Do you have a recommendation for a good machine-distro
combination that builds well and can show a potential user the capabilities of OE?

Thanks
David Farning


