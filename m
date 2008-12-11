Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LAi35-0007s4-GL
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 10:41:36 +0100
Received: by bwz8 with SMTP id 8so768692bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2008 01:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=b63MIQ769hYbxXYK2+MlavTKv+v52obDVnV01NBrGJ4=;
	b=NntSNAHlqW9veXIttdNM7fQ/gl6+ymFXhd4iZIkVe4drUjIqUvuA4C+h3ZXejqDSe5
	btCj0R54f41VtxHdffLFxkcyIF1Z0qy0ZkGgaAE8qED4yaV/fv/rv5eX9eZBxaXspcXg
	Tk5YX6N+HR9eTI8OpIveAkxvqPhVafBm+LwnU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=YI3Cf4Vv2qEfRNvv6vdOr6WSFno84ehFb6rn6JkX0Tcn1RPq+A/sox4YMTgPb+Ajxs
	JAWq8J0nJpYl4uAERy7zOY7LNHuhm3URng7H48EtLLkw21i/ZSorQy3DQ9JC9Sz1iAeT
	QaY6NTx2r1OmOWEChcsRx1lWywYFYQqyNF0fU=
Received: by 10.181.60.13 with SMTP id n13mr809761bkk.92.1228988245399;
	Thu, 11 Dec 2008 01:37:25 -0800 (PST)
Received: by 10.180.232.19 with HTTP; Thu, 11 Dec 2008 01:37:25 -0800 (PST)
Message-ID: <d1b08f940812110137g3369f156rfff59659b48b788f@mail.gmail.com>
Date: Thu, 11 Dec 2008 10:37:25 +0100
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ghqjue$4fe$1@ger.gmane.org>
MIME-Version: 1.0
References: <20081210234910.GA16050@excalibur.local> <49405BD7.2010801@gmx.de>
	<ghqjue$4fe$1@ger.gmane.org>
Subject: Re: [RFC] Ship dbus config and dbus service activation files
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
X-List-Received-Date: Thu, 11 Dec 2008 09:41:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

About connman, last time I built it I noticed it depends on
'resolvconf' which depends on 'bash'.

Is it right?


TIA

Andrea


