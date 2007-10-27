Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1IlnzV-0002Ed-0D
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Oct 2007 17:54:25 +0200
Received: by an-out-0708.google.com with SMTP id c31so175609ana
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Oct 2007 08:46:50 -0700 (PDT)
Received: by 10.100.213.19 with SMTP id l19mr2639469ang.1193499587331;
	Sat, 27 Oct 2007 08:39:47 -0700 (PDT)
Received: from lenovo ( [75.121.136.210])
	by mx.google.com with ESMTPS id 15sm4783125nzp.2007.10.27.08.39.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 27 Oct 2007 08:39:45 -0700 (PDT)
Received: by lenovo (sSMTP sendmail emulation); Sat, 27 Oct 2007 10:39:29 -0500
Date: Sat, 27 Oct 2007 10:39:29 -0500
From: David Farning <dfarning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071027153928.GA6118@lenovo>
References: <471FC1C0.4010103@linux.it> <20071025001926.GA14645@lenovo>
	<472047C3.20208@student.utwente.nl> <20071025121153.GA8231@lenovo>
	<f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>
	<20071026134528.GA6182@lenovo> <1193483219.6376.100.camel@toontown>
MIME-Version: 1.0
In-Reply-To: <1193483219.6376.100.camel@toontown>
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
X-List-Received-Date: Sat, 27 Oct 2007 15:54:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 27, 2007 at 01:06:59PM +0200, Tobias Pflug wrote:
> on 1: 
> with big picture I mean there should be a description of the 
> "system" with its main components. Currently i think there is too
> little of that, and too many use-cases. ("In order to change xyz,
> apply abc to 123").

I finished a rough draft of getting started this morning.  I am going
to let it sit for a week before looking at it again.  Then I will
rework as needed and submitte for review.

In the mean time I am starting on a introduction chapter.  This will
be a very high level overview.  Below is a first stab at the outline.

1.1. Linux ................................................
      1.1.1. Linux Overview ...................
      1.1.2. Linux Arctoture ...................
      1.1.3. Linux Development Model..
      1.1.4. Linux Open Source..............
1.2. Embedded Device ............................
      1.2.1. Device Architure..................
      1.2.2. Processor..............................
      1.2.3. Storage.................................
      1.2.4. Device..................................
1.3. Linux Distribution............................
      1.3.1. Kernel ..................................
      1.3.2. Userspace.............................
      1.3.3. File System ..........................
      1.3.4. Updating ..............................
1.4. System startup ..................................
      ...
1.5. Host/Target .......................................
      ...
1.6. Overview ..........................................
1.7. History..............................................

> For starters a diagram would do some good. I did one for a small
> report at work which however is rather incomplete. I should polish
> that a little. Depicting the interaction between bitbake, the different
> config file sets, internet resources, distributions and images. I think
> all of this should be presented before even starting to elaborate on
> how to build something

Diagrams may take awhile;(  I never seem to have the time to learn how
to make them.
 
> on 2:
> To me the biggest black box is still bitbake. The documentation
> seems somewhat lacking and I have a bad feeling about carrying out tasks
> where I don't quite understand what's going on. 
> 
> I still don't quite get how the dependency checking works and when
> changes to specific files will trigger an automatic rebuild and when
> I'll have to trigger that myself with a -crebuild / or maybe even 
> by fiddling with timestamps? Although my guts tell me that the latter
> is a NO-NO.

I have been avoiding these types of details until later sections. 

 
> David, I gather you are still working on the setup section? Maybe I
> could try contributing a "big picture" description, however my
> text will certainly require a lot of refinement from those with
> more background knowledge. 

At this point, what would be most helpful is looking at and tearing
apart the suggestions and drafts I submit;)  Between the introduction
and the getting started we should be able to provide a good big
picture.  Additionally, we can define terms which can be used
consistently through the rest of the documentation.


> David, will you also write on how to set up an OEDEV directory sturcure/
> sharing of working directories etc? Personally I am using the structure
> that cliff presented on the ml (I think) at some point which I find
> comfortable.

Again this will wait to a later chapter.  I think we will have a better
idea of the full outline after the introduction chapter is more filled
in.

Thanks
David Farning


