Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <shanevolpe@gmail.com>) id 1Kt3Yt-0002fV-Va
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Oct 2008 19:01:28 +0200
Received: by wf-out-1314.google.com with SMTP id 29so471925wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2008 10:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=Qzu4QjS6yjJ+lVxG4JHIQ+aFapnx4Y2ssX0mBwJsanQ=;
	b=XZIMqTedJcLa8Ita/iXd/Udy1GVIYl4MhreCZFXc3UQ4CjBHCRqiND7NVzOAzYmuM7
	1wtjsUnc+jdxkU2CbczybFp6EK1DbrhtpADa3C1+8fAH4Jgou1Dr+rTfsRXMob+fVPxr
	tANtIL+ik7MbbYC869E4nmoXD7QtrwLVkIz3c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=vjaqhjHeKcFvdDxC7UK/ZSo6VesCqmsNFddByS8ddN6xSnnJb4/1hdxKVhLcDEQ97X
	3hztMLfENwzJ2K8qkH48Ll6fmeQYGFba8JmB2By5l09uXE8fH6ja2ae5jNYSGmLyqR4G
	TULHsoThSdF346cXERi78fpxctHP5uv638ZRQ=
Received: by 10.114.13.10 with SMTP id 10mr890962wam.106.1224781255813;
	Thu, 23 Oct 2008 10:00:55 -0700 (PDT)
Received: by 10.114.24.11 with HTTP; Thu, 23 Oct 2008 10:00:55 -0700 (PDT)
Message-ID: <8c7950360810231000l40dcaae9oe69ce4229cca7193@mail.gmail.com>
Date: Thu, 23 Oct 2008 13:00:55 -0400
From: "Shane Volpe" <shanevolpe@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0810230753h58fbf106rdae7a2d613e8056b@mail.gmail.com>
MIME-Version: 1.0
References: <8c7950360810230631k530398dajbcbbf444a67333e5@mail.gmail.com>
	<c384c5ea0810230753h58fbf106rdae7a2d613e8056b@mail.gmail.com>
Subject: Re: LTP (Linux Test Project) better embedded support
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
X-List-Received-Date: Thu, 23 Oct 2008 17:01:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Leon,

>> Do you use LTP as-is from OE?
I have modified the LTP in OE to use the latest version of LTP and
apply patches for my system to allow LTP to run with out kernel dumps
do to lack of memory (RAM).   Originally I was going to add the
changes to OE but then decided LTP mainstream is were things need
addressed.

>> Yet another list to join. Maybe I will pass my remarks through you :-)
I will be more than willing to post any of your suggestions/ideas (or
anyone elses for that matter) to the LTP mail list.
Regards,
Shane


