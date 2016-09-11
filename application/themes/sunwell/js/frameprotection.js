if (top.frames.length!=0)
{
    if( window.location.href.replace )
        top.location.replace(self.location.href);
    else
        top.location.href = self.document.href;
}