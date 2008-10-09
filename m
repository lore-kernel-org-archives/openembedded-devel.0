Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Kns5G-0003S8-Rr
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Oct 2008 11:45:27 +0200
Received: by qw-out-1920.google.com with SMTP id 5so1116605qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Oct 2008 02:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=u4V4eT2I3IDPvyXNHW/tme1LliT3Sbn1yYLgt7wMuTE=;
	b=eccaIYqrmPwDSMg/B3oLYLjOLvfjVjtgwLSexNb3H0izDnNXuRpJtDvCDN+qJMiFOr
	b2YJXCoB3M1lFGbvGPKx/ciVKxoDeSJhMlJ2wkPa72kL9ltnYkO6KdhB+nAqWaIdEC82
	gBd/XUZIZeE3v+dfhhzpQnzrekq0v9AqalfgA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=pgqYXyiuAC/Ta/cY+jOt9Mk1+RMO9yS0CgelbVUUM+sVxjinY9qfbS4FtdqXETi28N
	Zy6KvdrKFjtgkVwMu7NvSJ2+Fk8EVSeO6aXT4HLzRZuIAbCaFlHH/f+XYHMkf25jW+0e
	O9GDxRSlPdyueaml1e7KolMFPXWuB3UHLqEj0=
Received: by 10.214.44.5 with SMTP id r5mr12489165qar.61.1223545244723;
	Thu, 09 Oct 2008 02:40:44 -0700 (PDT)
Received: by 10.214.12.10 with HTTP; Thu, 9 Oct 2008 02:40:44 -0700 (PDT)
Message-ID: <c384c5ea0810090240l2adf1606h110236f88a101ed2@mail.gmail.com>
Date: Thu, 9 Oct 2008 11:40:44 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gckdp2$qo7$1@ger.gmane.org>
MIME-Version: 1.0
References: <gckdp2$qo7$1@ger.gmane.org>
Subject: Re: .dev broken after gettext changes
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
X-List-Received-Date: Thu, 09 Oct 2008 09:45:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Oct 9, 2008 at 10:01 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> So inbetween those commits OE became unbuildable.
>

See Michael message on the ml, I think he reverted the offending
commit. Not sure if that resolves the problem completely, anyone?

Regards,
-- 
Leon


