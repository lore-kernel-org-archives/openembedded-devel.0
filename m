Received: from [66.249.82.227] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1IlUuz-00076N-QC
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2007 21:32:29 +0200
Received: by wx-out-0506.google.com with SMTP id h27so922220wxd
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2007 12:24:59 -0700 (PDT)
Received: by 10.70.89.5 with SMTP id m5mr4928323wxb.1193406334973;
	Fri, 26 Oct 2007 06:45:34 -0700 (PDT)
Received: from lenovo ( [69.179.85.165])
	by mx.google.com with ESMTPS id i39sm8609583wxd.2007.10.26.06.45.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Oct 2007 06:45:34 -0700 (PDT)
Received: by lenovo (sSMTP sendmail emulation); Fri, 26 Oct 2007 08:45:28 -0500
Date: Fri, 26 Oct 2007 08:45:28 -0500
From: David Farning <dfarning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071026134528.GA6182@lenovo>
References: <471FC1C0.4010103@linux.it> <20071025001926.GA14645@lenovo>
	<472047C3.20208@student.utwente.nl> <20071025121153.GA8231@lenovo>
	<f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>
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
X-List-Received-Date: Fri, 26 Oct 2007 19:32:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 25, 2007 at 01:34:51PM -0400, Cliff Brake wrote:
> 
> I suppose it depends -- saying that I'm "building a packages" is
> technically correct as the ipk/deb is the output.  But, "bitbaking a
> recipe" is probably more correct.
> 
> perhaps recipe -- that way it is very obvious what we are talking about.


Nice, Bitbaking a recipe or informally, baking a recipe, is very obvious.
Once BitBake and recipe have been defined it will be clear what we are
talking about.  Also it will eliminate the [make, build, create, run,
deploy][package, package set, task, target,distro] ambiguity.

Thanks
David Farning  


