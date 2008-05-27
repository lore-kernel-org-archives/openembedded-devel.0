Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1K0nKY-00017x-IF
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 May 2008 02:46:22 +0200
Received: by wa-out-1112.google.com with SMTP id j37so2424022waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2008 17:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=uegHbdOSbDMcc1OD88wry/iWOzRPnOyB1AoutSdKSvk=;
	b=HSjKHg6VurtHgkMz/0xkyngWfetMTBXXQzfe5CF4M//WuKoiWG2U9+msAxCZcln02O3RpZ475o0AyCA/hVvqmKmFuyZnQU5daDQD82znm6gRZr8PvqbqkAmgj5LY1zZlWBdwNFyv3KQzStGtV706AydBORC4a+QXFVqTlODg1oI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=m9bj7rivnzZl/06kof+D/H3gptxsGGOvO0p8g9lygZzv2+wOcOLrLideu7rJZHrG+/Y5DRIAvDfMdYaEccrv1iPb0Qt/Ew2ngHIZ11liQJqPEAidRY40dU0lPzokKvoLmoqf6oKLc+9sQuCl1jLywJm7KLsIOVnu8Re19CFZTAA=
Received: by 10.115.32.1 with SMTP id k1mr679113waj.107.1211848982287;
	Mon, 26 May 2008 17:43:02 -0700 (PDT)
Received: by 10.114.184.13 with HTTP; Mon, 26 May 2008 17:43:02 -0700 (PDT)
Message-ID: <f96d234e0805261743t77560223k2b1a95fabee6f29d@mail.gmail.com>
Date: Mon, 26 May 2008 20:43:02 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g1eulp$skn$1@ger.gmane.org>
MIME-Version: 1.0
References: <g1eulp$skn$1@ger.gmane.org>
Subject: Re: RFC: restart wiki from scratch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 27 May 2008 00:46:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, May 26, 2008 at 2:14 PM, Rolf Leggewie
<no2spam@nospam.arcornews.de> wrote:
> Hi,
>
> the openembedded website is in rather bad shape lately.  This includes
> the wiki which has both technical and content problems.  I suggest to
> start anew.
>
> I'd like to go with mediawiki instead this time for the simple reason
> that there are more of us who are actually familiar with this software
> both from an admin and a user perspective.  Mediawiki was the software
> for the OZ wiki which at its time wasn't doing too badly.
>
> Whatever we do, I think we should not allow the current state to exist
> much longer.

Agreed, we should do something.  While the current site with all the
plugins like file browsing is neat, I wonder if we would be better off
implementing the main site in a rock solid wiki that offers:

1) RSS feeds on changes
2) a decent recent changes page
3) SPAM protection and easy to revert spam.

I look at the sites like:
http://www.mono-project.com/Main_Page
http://wiki.openzaurus.org/Main_Page
http://wiki.openmoko.org/wiki/Main_Page

as good examples.

The wiki model is well understood, easy to use, and might be a good
foundation for a main site.

I'd be glad to assist where I can if man-power is needed on the setup
side of things.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


