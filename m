Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 45D28606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 17:37:39 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id f93so4021548lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 10:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=RuUjAyuylf/2PQ+/O3ezgm5KiJSCi6T8SUe0OqY7HZE=;
	b=XR3n/UuyLgl1r4K0noYpEUN+5wHnILeyBYp1MTgWb/Z+npIL+hD9oVkTl7JdY7XyqM
	EAEaZWGcjdO0ZZ4zkm+C9o6EiDRAqJ1+y6647yc5s1d8dXABNx65tnLE2k+WyOlyCc2E
	ofprPsQi2XEOyob6/V7JBXYJ7RQDqyUL++9xhflmwVqSxG0TYBhLxMc5IvgGe7JRUcfW
	ZHi4yLtUWHKTy+KVaVY9aSRVN7JnPjKR1IuuIpQcPhVFMubyqpNTUH2pg3KFXm+ttFoQ
	LN5WGsmpYXdvlqspFeA/T2AmIXlmIM1atuWWj88eexxdZGHvpKeGsuZx++Vnd+NAy8A7
	Zpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=RuUjAyuylf/2PQ+/O3ezgm5KiJSCi6T8SUe0OqY7HZE=;
	b=d0Nt8uCtKB28BK9KuourzMh7yyLbs7t2Ul1g3ZTLlZnMcIRUfz00q3MCC2LRAVwZFq
	hCyefMaJg9e7dlWC7IA4vQdLbivXjGaV5Biq9z8DY2fxoofn+ad8zuYal/Ozio57QrL0
	7kfkQhVX092DJO77Q3PnYqlBT3Nu2yc93N9B3hRQr/KuyBl2tU04BLzwsnExlCo6qob5
	BNv1+cSKUPcJRmuk9x6oGmjoVQBP8W0F8voLAiw5jV2K8aRIpp3xIkRy0rsKk0vwZ51J
	RAf7+fM3XROCxvMnPmZow1Q1NFlDioVXIxWNx5coSUWnNjWd60WtMwBSCXIlW1Q8zN5g
	9Euw==
X-Gm-Message-State: ALyK8tIS8ZXe3PeGN4gfPAvIVSV5T8KP0hC6YbwcLqoOl1bC281EVBDBtY89tnsg6vo2RKSPDzSBkS1p/JGteQ==
X-Received: by 10.25.165.71 with SMTP id o68mr4252418lfe.95.1469036259714;
	Wed, 20 Jul 2016 10:37:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Wed, 20 Jul 2016 10:37:39 -0700 (PDT)
In-Reply-To: <1469035439-23466-1-git-send-email-cynthia.ms.chiu@gmail.com>
References: <1469035439-23466-1-git-send-email-cynthia.ms.chiu@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Jul 2016 19:37:39 +0200
Message-ID: <CA+chaQcKT3UUFryKvo40Y2b4Ng28Afig3_257bx309PLN4VgNA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v3] Pointing the LIC_FILES_CHKSUM to a valid file.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jul 2016 17:37:40 -0000
Content-Type: text/plain; charset=UTF-8

Squash this into v2 to make it proper v3.

Thanks.

On Wed, Jul 20, 2016 at 7:23 PM, cynthiachiu <cynthia.ms.chiu@gmail.com>
wrote:

> Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
> ---
>  meta-oe/recipes-extended/canopennode/canopensocket_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> index 7c58a26..1e0f7d0 100644
> --- a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> +++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Linux CANOpen tools"
>  DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM =
> "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  SRC_URI = "gitsm://github.com/CANopenNode/CANopenSocket.git"
>  SRCREV = "7777653da3a630b0dc02b3fa5ff029d9bc57cd26"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

